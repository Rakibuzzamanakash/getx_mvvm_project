
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_project/data/response/status.dart';
import 'package:getx_mvvm_project/res/components/general_exception_widgets.dart';
import 'package:getx_mvvm_project/res/components/internet_exceptions_widgets.dart';
import 'package:getx_mvvm_project/res/routes/routes_name.dart';
import 'package:getx_mvvm_project/view_models/controller/home/home_view_models.dart';
import 'package:getx_mvvm_project/view_models/controller/user_preference/user_preference_view_model.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
   UserPreference userPreference = UserPreference();

   final homeViewModel = Get.put(HomeViewModels());

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeViewModel.userListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: (){
                userPreference.removeUser().then((value) {
                  Get.toNamed(RouteName.loginView);
                });
              },
              icon: Icon(Icons.logout)
          )
        ],
      ),
      body: Obx(() {
        switch(homeViewModel.rxRequestStatus.value){
          case Status.LOADING :
            return Center(child: CircularProgressIndicator());
          case Status.ERROR :
            if(homeViewModel.error.value == 'No Internet,'){
              return InternetExceptionWidget(onPress: (){
                homeViewModel.refreshApi();
              });
            }else{
              return  GeneralExceptionWidget(
                  onPress: (){
                homeViewModel.refreshApi();
              });
            }

          case Status.COMPLETED :
           return ListView.builder(
               itemCount:homeViewModel.userList.value.data!.length ,
               itemBuilder: (context , index){
                 return Card(
                   child: ListTile(
                      title: Text(homeViewModel.userList.value.data![index].firstName.toString()),
                      subtitle: Text(homeViewModel.userList.value.data![index].email.toString()),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(homeViewModel.userList.value.data![index].avatar.toString()),
                      ),
                   ),
                 );
               }
           );
        }
      }),
    );
  }
}
