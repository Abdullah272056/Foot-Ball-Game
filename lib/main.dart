
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'app/stats/top_assists_player_list_page/top_assists_player_list_page_view.dart';
import 'app/stats/top_goal_scrorer_player_list_page/top_goal_scrorer_player_list_page_view.dart';


Future<void> main() async {



  runApp( MyMehendiDesignApp());
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   // statusBarColor:awsStartColor,
  //   // systemNavigationBarColor:awsEndColor,
  // ));

}

class MyMehendiDesignApp extends StatelessWidget {
  MyMehendiDesignApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {


    return  ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,


          home:
          TopAssistsPlayerListPageView(),

        );
      },

    );




  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("AppLifecycleState changed: $state");
    if (state == AppLifecycleState.resumed) {
      //_showToast("resumed");
    }
  }





}