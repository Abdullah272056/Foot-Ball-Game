import 'package:flag/flag_enum.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foot_ball/app/stats/top_goal_scrorer_player_list_page/top_goal_scrorer_player_list_page_view_controller.dart';
import 'package:foot_ball/premier_league_page_screen/premear_league_page_view_controller.dart';
import 'package:foot_ball/splash_screen/splash_screen_page_controller.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import '../../../constant/Colors.dart';
import '../../../utils/assets.dart';






class TopGoalScrorerPlayerListPageView extends StatelessWidget {

   final pageController = Get.put(TopGoalScrorerPlayerListPageViewController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body:SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Container(
              decoration: const BoxDecoration(
                color:bgColor,
              ),
              child: Center(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [


                    Expanded(child:   Column(
                      children: [
                        Expanded(
                            child:ListView.builder(
                                padding: EdgeInsets.only(bottom: 20 ,top: 15 ),
                                itemCount: 10,
                                itemBuilder: (BuildContext context, int index) {
                                  return topScorerListItem( index);
                                })),
                      ],
                    ),),

                  ],
                ),
              )

          ),
        ),
      )
    );
  }





   Widget topScorerListItem(int index ){
     return  Container(
       padding: EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),
       child: Row(
         children: [

           Container(
             margin: EdgeInsets.only(left: 10,right: 10),
             child: Text(
               "${index+1}",
               maxLines: 1,
               overflow: TextOverflow.ellipsis,
               textAlign: TextAlign.right,
               style:   TextStyle(
                   color:textColor,
                   fontSize: 14.sp,
                   fontWeight: FontWeight.w500),
             ),
           ),

           Expanded(child: Row(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
              Container(
             height: 45.w, width: 45.w,

             child:ClipRRect(
               borderRadius: BorderRadius.circular(40.r),
               // Adjust the radius to control the rounding
               child:Container(
                 // padding: EdgeInsets.all(5),
                 color: Colors.white,
                 child: FadeInImage.assetNetwork(
                   fit: BoxFit.fill,
                   placeholder: Assets.profileAvater,
                   image:"https://www.seekpng.com/png/full/258-2582312_mohamed-salah.png",
                   imageErrorBuilder: (context, url, error) =>
                       Image.asset(
                         Assets.profileAvater,
                         fit: BoxFit.fill,
                       ),
                 ),
               ),


             ),
           ),
               SizedBox(width: 10.w,),
               Expanded(child: Column(
                 children: [
                   Row(
                     children: [
                       Expanded(child:   Text(
                         "Mohamed Salah",
                         maxLines: 3,
                         overflow: TextOverflow.ellipsis,
                         textAlign: TextAlign.left,
                         style:   TextStyle(
                             color:textColor,
                             fontSize: 15.sp,
                             fontWeight: FontWeight.w500),
                       )),

                     ],
                   ),
                   SizedBox(height: 2,),
                   Row(
                     children: [


                       Flag.fromCode(
                         FlagsCode.AR,
                         height: 10.h,
                         width: 15.w,
                         fit: BoxFit.fill,
                       ),
                       SizedBox(width: 8.w,),

                       // Container(
                       //   padding: EdgeInsets.all(10),
                       //   color: Colors.white,
                       //   child: FadeInImage.assetNetwork(
                       //     fit: BoxFit.fill,
                       //     placeholder: Assets.profileAvater,
                       //     image:"https://ssl.gstatic.com/onebox/media/sports/logos/paYnEE8hcrP96neHRNofhQ_96x96.png",
                       //     imageErrorBuilder: (context, url, error) =>
                       //         Image.asset(
                       //           Assets.profileAvater,
                       //           fit: BoxFit.fill,
                       //         ),
                       //   ),
                       // ),

                       Expanded(child:   Text(
                         "Egyptian footballer",
                         maxLines: 3,
                         overflow: TextOverflow.ellipsis,
                         textAlign: TextAlign.left,
                         style:   TextStyle(
                             color:smallTextColor,
                             fontSize: 14,
                             fontWeight: FontWeight.normal),
                       ))
                     ],
                   )
                 ],
               ))


             ],)),

           Container(
             margin: EdgeInsets.only(left: 10,right: 10),
             child: Text(
               "${20-index}",
               maxLines: 1,
               overflow: TextOverflow.ellipsis,
               textAlign: TextAlign.right,
               style:   TextStyle(
                   color:boldTextColor,
                   fontSize: 15,
                   fontWeight: FontWeight.w500),
             ),
           )
         ],
       ),
     );
   }



}

