import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_project/data/response/status.dart';
import 'package:getx_mvvm_project/models/home/user_list_model.dart';
import 'package:getx_mvvm_project/repository/home_repository/home_repository.dart';

class HomeViewModels extends GetxController {

  final _api = HomeRepository();

  final rxRequestStatus = Status.LOADING.obs ;
 final userList = UserListModel().obs;
 RxString error = ''.obs;

 void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
 void setUserList(UserListModel _value) => userList.value = _value;
 void setError(String _value) => error.value = _value;


 void userListApi(){
   //setRxRequestStatus(Status.LOADING);
   _api.userListApi().then((value) {
   setRxRequestStatus(Status.COMPLETED);
   setUserList(value);
   }).onError((error, stackTrace) {
     if (kDebugMode) {
       print(error);
       print(stackTrace);
     }
     setError(error.toString());
     setRxRequestStatus(Status.ERROR);
   }) ;
 }

 void refreshApi(){
   setRxRequestStatus(Status.LOADING);
   _api.userListApi().then((value) {
   setRxRequestStatus(Status.COMPLETED);
   setUserList(value);
   }).onError((error, stackTrace) {
     if (kDebugMode) {
       print(error);
       print(stackTrace);
     }
     setError(error.toString());
     setRxRequestStatus(Status.ERROR);
   }) ;
 }

}