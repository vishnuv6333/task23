import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:task23/presentation/controller.dart';

import '../data/apiclient/apiClient.dart';
import '../data/data_resource/remote_data_resource.dart';
import '../domain/repository_implementation/data_repository_implementation.dart';
import '../domain/usecase/get_posts_usecase.dart';

class DependencyInjection {
  static init() {
    Get.lazyPut(() => ApiClient(Client()), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => GetPostsUsecse(Get.find()), fenix: true);
    Get.lazyPut(() => RemoteDataSourceImpl(Get.find()), fenix: true);
    Get.lazyPut(() => DataRepositoryImpl(Get.find()), fenix: true);
  }
}
