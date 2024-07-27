
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot_ball/premier_league_page_screen/premear_league_page_view.dart';
import 'package:foot_ball/splash_screen/splash_screen.dart';
import 'package:foot_ball/today_games_details_page_screen/today_game_details_page_view.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'app/all_match_list_page/view/all_match_list_page.dart';
import 'app/all_player_list_page/view/all_player_list_page.dart';
import 'app/stats/top_assists_player_list_page/top_assists_player_list_page_view.dart';
import 'app/stats/top_goal_scrorer_player_list_page/top_goal_scrorer_player_list_page_view.dart';
import 'app/stats/top_yellow_cards_player_list_page/top_yellow_cards_player_list_page_view.dart';
import 'calender_page_screen/calender_page_view.dart';
import 'firebase/FCM.dart';
import 'firebase/NotificationServices.dart';
import 'news_page_screen/news_page_view.dart';


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  runApp( MyApp());
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   // statusBarColor:awsStartColor,
  //   // systemNavigationBarColor:awsEndColor,
  // ));

}



class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  static final navKey = GlobalKey<NavigatorState>();
  var notificationTitle = 'No Title';
  var notificationBody = 'No Body';
  var notificationData = 'No Data';
  @override
  void initState() {
    print('My app initState');
    WidgetsFlutterBinding.ensureInitialized();


    final firebaseMessaging = FCM();
    firebaseMessaging.setNotifications();

    firebaseMessaging.streamCtlr.stream.listen(_changeData);
    firebaseMessaging.bodyCtlr.stream.listen(_changeBody);
    firebaseMessaging.titleCtlr.stream.listen(_changeTitle);
  }
  _changeData(String msg) {
    notificationData = msg;
  }

  _changeBody(String msg) {
    notificationBody = msg;
    final context = MyApp.navKey.currentState?.overlay?.context;
    // _showAlert(Get.context!, notificationTitle, notificationBody, notificationData);
  }

  _changeTitle(String msg) {
    notificationTitle = msg;
  }

  @override
  Widget build(BuildContext context) {

    NotificationServices notificationServices = NotificationServices();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);



    return  ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home:
          // AllMatchListScreenPage(),
          AllPlayerListScreenPage(),
          // NewsPageView(),
          // CalenderPageView(),
          // PremierLeaguePageView(),
          // AppPlayerListScreenPage(),
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




