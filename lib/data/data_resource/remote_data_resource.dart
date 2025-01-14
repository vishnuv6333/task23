import '../../core/constants/api_contant.dart';
import '../../presentation/model.dart';
import '../apiclient/apiClient.dart';

class RemoteDataSourceImpl {
  final ApiClient _apiClient;

  RemoteDataSourceImpl(this._apiClient);

  Future<PostModel> getPosts(Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.defaultWebUrl, params);
    return PostModel.fromJson(response);
  }
}
