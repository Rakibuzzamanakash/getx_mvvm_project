import 'package:getx_mvvm_project/data/network/network_api_services.dart';
import 'package:getx_mvvm_project/res/app_url/app_url.dart';

class LoginRepository {
  
  final _apiService = NetworkApiServices();
  
  Future<dynamic> loginApi(var data) async{
    dynamic response = await _apiService.postApi(data, AppUrl.loginApi);
    return response;
  }
}