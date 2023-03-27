import 'package:getx_mvvm_project/models/login/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {

  Future<bool> saveUser(UserModel userModel) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', userModel.token.toString());
    return true;
  }

  Future<UserModel> getUser() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString('token');
    return UserModel(
      token: token
    );
  }

  Future<bool> removeUser() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }


}