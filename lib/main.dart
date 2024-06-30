
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot_ball/premier_league_page_screen/premear_league_page_view.dart';
import 'package:foot_ball/splash_screen/splash_screen.dart';
import 'package:foot_ball/today_games_details_page_screen/today_game_details_page_view.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'app/all_player_list_page/view/all_player_list_page.dart';
import 'app/stats/top_assists_player_list_page/top_assists_player_list_page_view.dart';
import 'app/stats/top_goal_scrorer_player_list_page/top_goal_scrorer_player_list_page_view.dart';
import 'app/stats/top_yellow_cards_player_list_page/top_yellow_cards_player_list_page_view.dart';
import 'calender_page_screen/calender_page_view.dart';
import 'news_page_screen/news_page_view.dart';


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
          AppPlayerListScreenPage(),

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