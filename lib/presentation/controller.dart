import 'package:get/get.dart';
import 'package:task23/domain/usecase/get_posts_usecase.dart';

import '../core/utils/snack_bar_utils.dart';
import 'model.dart';

class HomeController extends GetxController {
  GetPostsUsecse getPostsUsecse = Get.find();
  RxBool isloading = false.obs;
  List<Result> result = [];
  @override
  void onInit() {
    getPosts();
    super.onInit();
  }

  getPosts() async {
    isloading.value = true;
    PostParam maintenanceParam = const PostParam(
        id: "1",
        jsonrpc: "2.0",
        method: "bridge.get_ranked_posts",
        params: {"sort": "trending", "tag": "", "observer": "hive.blog"});
    final response = await getPostsUsecse(maintenanceParam);
    response.fold((l) => l.handleError(), (r) {
      if (r.result!.isNotEmpty) {
        result.addAll(r.result??[]);
        isloading.value=false;
      } else {
        showMessage("Something wrong");
      }
    });
  }
}
