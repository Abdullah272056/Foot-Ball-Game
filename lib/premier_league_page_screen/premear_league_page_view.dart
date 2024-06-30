import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foot_ball/premier_league_page_screen/premear_league_page_view_controller.dart';
import 'package:foot_ball/splash_screen/splash_screen_page_controller.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import '../constant/Colors.dart';
import '../utils/assets.dart';




class PremierLeaguePageView extends StatelessWidget {

   final pageController = Get.put(PremierLeaguePageViewController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body:SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Container(
              decoration: const BoxDecoration(
                color:Colors.black,
              ),
              child: Center(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Row(children: [
                      Expanded(child: TabBar(
                        tabs: [
                          Tab(text: 'SCHEDULE',),
                          Tab(text: 'STANDING',),
                          Tab(text: 'TOP SCORERS',),
                        ],
                        indicatorWeight: 4,

                        onTap: (value){

                          print("ontap= $value");


                        },
                      ),  )
                    ],),

                    Expanded(child:  TabBarView(
                      children: [



                        ///schedule section
                        categoryItemSchedule(),



                        ///Home section
                        Expanded(child: Column(
                          children: [
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Expanded(child: standingListItemTitle( ),)
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Expanded(child:   Text(
                                  "PREMIER LEAGUE -ROUND 0",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style:   TextStyle(
                                      color:Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                )),

                              ],
                            ),
                            SizedBox(height: 5,),


                            Expanded(
                                child:ListView.builder(
                                    padding: EdgeInsets.only(bottom: 20 ,top: 5 ),
                                    itemCount: 35,
                                    itemBuilder: (BuildContext context, int index) {
                                      return standingListItem( index);
                                    })),
                          ],
                        )),



                        ///Today section
                        Column(
                          children: [
                            Expanded(
                                child:ListView.builder(
                                    padding: EdgeInsets.only(bottom: 20 ,top: 15 ),
                                    itemCount: 20,
                                    itemBuilder: (BuildContext context, int index) {
                                      return topScorerListItem( index);
                                    })),
                          ],
                        ),

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


   Widget standingListItemTitle( ){
     return Row(
       children: [
       Expanded(child: Container()),

         Container(

           color: Colors.transparent,
           width: 22,
           margin: EdgeInsets.only(left: 4,right: 0),
           child: Center(
             child: Text(
               "GP",
               maxLines: 1,
               overflow: TextOverflow.ellipsis,
               textAlign: TextAlign.left,
               style:   TextStyle(
                   color:Colors.white,
                   fontSize: 13,
                   fontWeight: FontWeight.w500),
             ),
           ),
         ),
         Container(

           color: Colors.transparent,
           width: 22,
           margin: EdgeInsets.only(left: 4,right: 0),
           child: Center(
             child: Text(
               "W",
               maxLines: 1,
               overflow: TextOverflow.ellipsis,
               textAlign: TextAlign.left,
               style:   TextStyle(
                   color:Colors.white,
                   fontSize: 13,
                   fontWeight: FontWeight.w500),
             ),
           ),
         ),
         Container(

           color: Colors.transparent,
           width: 22,
           margin: EdgeInsets.only(left: 4,right: 0),
           child: Center(
             child: Text(
               "D",
               maxLines: 1,
               overflow: TextOverflow.ellipsis,
               textAlign: TextAlign.left,
               style:   TextStyle(
                   color:Colors.white,
                   fontSize: 13,
                   fontWeight: FontWeight.w500),
             ),
           ),
         ),
         Container(

           color: Colors.transparent,
           width: 22,
           margin: EdgeInsets.only(left: 4,right: 0),
           child: Center(
             child: Text(
               "L",
               maxLines: 1,
               overflow: TextOverflow.ellipsis,
               textAlign: TextAlign.left,
               style:   TextStyle(
                   color:Colors.white,
                   fontSize: 13,
                   fontWeight: FontWeight.w500),
             ),
           ),
         ),
         Container(

           color: Colors.transparent,
           width: 45,
           margin: EdgeInsets.only(left: 4,right: 0),
           child: Center(
             child: Text(
               "GF-GA",
               maxLines: 1,
               overflow: TextOverflow.ellipsis,
               textAlign: TextAlign.left,
               style:   TextStyle(
                   color:Colors.white,
                   fontSize: 13,
                   fontWeight: FontWeight.w500),
             ),
           ),
         ),
         Container(

           color: Colors.transparent,
           width: 30,
           margin: EdgeInsets.only(left: 4,right: 0),
           child: Center(
             child: Text(
               "GD",
               maxLines: 1,
               overflow: TextOverflow.ellipsis,
               textAlign: TextAlign.left,
               style:   TextStyle(
                   color:Colors.white,
                   fontSize: 13,
                   fontWeight: FontWeight.w500),
             ),
           ),
         ),
         Container(

           color: Colors.transparent,
           width: 30,
           margin: EdgeInsets.only(left: 4,right: 0),
           child: Center(
             child: Text(
               "PTS",
               maxLines: 1,
               overflow: TextOverflow.ellipsis,
               textAlign: TextAlign.left,
               style:   TextStyle(
                   color:Colors.white,
                   fontSize: 13,
                   fontWeight: FontWeight.w500),
             ),
           ),
         ),


       ],
     )

     ;
   }

   Widget categoryItemSchedule( ) {
     return Column(
       children: [
         Expanded(
             child:ListView.builder(
               itemCount: 10,
               itemBuilder: (BuildContext context, int index) {
                 return StickyHeader(
                   header: Row(
                     children: [
                       Expanded(child: Container(
                           color: categoryBgColor,
                           padding:   EdgeInsets.only(left: 10,top: 8,bottom: 8,right: 8 ),
                           child: Row(
                             children: [

                               Expanded(child: Text("SATURDAY, AUGUST 12 2023",
                                 style: TextStyle(
                                     color: Colors.white,
                                     fontSize: 15 ,
                                     decoration: TextDecoration.none,
                                     fontWeight: FontWeight.normal),
                               )),

                               Text("ROUND 1",
                                 style: TextStyle(
                                     color: Colors.white,
                                     fontSize: 11 ,
                                     decoration: TextDecoration.none,
                                     fontWeight: FontWeight.normal),
                               )
                             ],
                           )
                       ),),
                     ],
                   ),
                   content: Column(
                     children: [
                       ListView.builder(
                           padding: EdgeInsets.zero,
                           itemCount:4,
                           shrinkWrap: true,
                           physics: const NeverScrollableScrollPhysics(),
                           itemBuilder: (BuildContext context, int index) {
                             return categoryListItemSchedule();
                           })
                     ],

                   ),
                 );
               },
             )

         ),
       ],
     );




   }

   ///TODO: list view item

   Widget categoryListItemSchedule( ){
     return  Container(
       padding: EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),
       child: Row(
         children: [
           Icon(Icons.notifications_rounded,size: 18,color: Colors.white,),
           SizedBox(
             width: 10,
           ),

           Expanded(child: Row(
             mainAxisAlignment: MainAxisAlignment.end,

             children: [
             Expanded(child:   Text(
                 "Bashundhara Kings",
                 maxLines: 3,
                 overflow: TextOverflow.ellipsis,
                 textAlign: TextAlign.right,
                 style:   TextStyle(
                     color:Colors.white,
                     fontSize: 14,
                     fontWeight: FontWeight.w400),
               )),
               SizedBox(width: 3,),
             Container(
               height: 25, width: 25,

               child:ClipRRect(
                 borderRadius: BorderRadius.circular(25), // Adjust the radius to control the rounding
                 child:FadeInImage.assetNetwork(
                   fit: BoxFit.fill,
                   placeholder: Assets.profileAvater,
                   image:"https://ssl.gstatic.com/onebox/media/sports/logos/8NSdffH3dYyTy5jLBAKDZA_96x96.png",
                   imageErrorBuilder: (context, url, error) =>
                       Image.asset(
                         Assets.profileAvater,
                         fit: BoxFit.fill,
                       ),
                 ),


               ),
             ),

           ],)),

           SizedBox(width: 5,),
           Column(
             children: [
               Row(
                 children: [
                   Text(
                     "3 - 1",
                     maxLines: 3,
                     overflow: TextOverflow.ellipsis,
                     textAlign: TextAlign.center,
                     style:   TextStyle(
                         color:Colors.white,
                         fontSize: 12,
                         fontWeight: FontWeight.normal),
                   )
                 ],
               ),
               SizedBox(height: 3,),
               Row(
                 children: [
                   Text(
                     "6:30Pm",
                     maxLines: 1,
                     overflow: TextOverflow.ellipsis,
                     textAlign: TextAlign.center,
                     style:   TextStyle(
                         color:Colors.green,
                         fontSize: 12,
                         fontWeight: FontWeight.bold),
                   )
                 ],
               ),
             ],
           ),

           SizedBox(width: 5,),


           Expanded(child: Row(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
             Container(
               height: 25, width: 25,

               child:ClipRRect(
                 borderRadius: BorderRadius.circular(25), // Adjust the radius to control the rounding
                 child:FadeInImage.assetNetwork(
                   fit: BoxFit.fill,
                   placeholder: Assets.profileAvater,
                   image:"https://ssl.gstatic.com/onebox/media/sports/logos/paYnEE8hcrP96neHRNofhQ_96x96.png",
                   imageErrorBuilder: (context, url, error) =>
                       Image.asset(
                         Assets.profileAvater,
                         fit: BoxFit.fill,
                       ),
                 ),


               ),
             ),
           SizedBox(width: 3,),

           Expanded(child:   Text(
             "Abahani Limited Dhaka",
             maxLines: 3,
             overflow: TextOverflow.ellipsis,
             textAlign: TextAlign.left,
             style:   TextStyle(
                 color:Colors.white,
                 fontSize: 14,
                 fontWeight: FontWeight.w400),
           ))
           ],)),

           Icon(Icons.arrow_right,size: 18,color: Colors.white,)
         ],
       ),
     );
   }
   Widget standingListItem(int index ){
     return Row(
       children: [
         Container(

           height: 45,
           margin: EdgeInsets.only(left: 0,right: 10,top: 1,bottom: 1),
           padding: EdgeInsets.only(left: 6,right: 6),
           color:index<5? Colors.green:Colors.transparent,
           child: Center(
             child: Text(
               "${index+1}",
               maxLines: 1,
               overflow: TextOverflow.ellipsis,
               textAlign: TextAlign.right,
               style:   TextStyle(
                   color:Colors.white,
                   fontSize: 13,
                   fontWeight: FontWeight.w500),
             ),
           ),
         ),
         Expanded(child: Row(
           mainAxisAlignment: MainAxisAlignment.end,
           children: [
             Container(
               height: 30, width: 30,

               child:ClipRRect(
                 borderRadius: BorderRadius.circular(40),
                 // Adjust the radius to control the rounding
                 child:Container(
                   padding: EdgeInsets.all(5),
                   color: Colors.white,
                   child: FadeInImage.assetNetwork(
                     fit: BoxFit.fill,
                     placeholder: Assets.profileAvater,
                     image:"https://ssl.gstatic.com/onebox/media/sports/logos/8NSdffH3dYyTy5jLBAKDZA_96x96.png",
                     imageErrorBuilder: (context, url, error) =>
                         Image.asset(
                           Assets.profileAvater,
                           fit: BoxFit.fill,
                         ),
                   ),
                 ),


               ),
             ),
             SizedBox(width: 10,),
             Expanded(child:   Text(
               "Arsenal",
               maxLines: 3,
               overflow: TextOverflow.ellipsis,
               textAlign: TextAlign.left,
               style:   TextStyle(
                   color:Colors.white,
                   fontSize: 14,
                   fontWeight: FontWeight.w500),
             )),


           ],)),

         Container(

           color: Colors.transparent,
           width: 22,
           margin: EdgeInsets.only(left: 4,right: 0),
           child: Center(
             child: Text(
               "13",
               maxLines: 1,
               overflow: TextOverflow.ellipsis,
               textAlign: TextAlign.left,
               style:   TextStyle(
                   color:Colors.white,
                   fontSize: 13,
                   fontWeight: FontWeight.w500),
             ),
           ),
         ),
         Container(

           color: Colors.transparent,
           width: 22,
           margin: EdgeInsets.only(left: 4,right: 0),
           child: Center(
             child: Text(
               "9",
               maxLines: 1,
               overflow: TextOverflow.ellipsis,
               textAlign: TextAlign.left,
               style:   TextStyle(
                   color:Colors.white,
                   fontSize: 13,
                   fontWeight: FontWeight.w500),
             ),
           ),
         ),
         Container(

           color: Colors.transparent,
           width: 22,
           margin: EdgeInsets.only(left: 4,right: 0),
           child: Center(
             child: Text(
               "3",
               maxLines: 1,
               overflow: TextOverflow.ellipsis,
               textAlign: TextAlign.left,
               style:   TextStyle(
                   color:Colors.white,
                   fontSize: 13,
                   fontWeight: FontWeight.w500),
             ),
           ),
         ),
         Container(

           color: Colors.transparent,
           width: 22,
           margin: EdgeInsets.only(left: 4,right: 0),
           child: Center(
             child: Text(
               "1",
               maxLines: 1,
               overflow: TextOverflow.ellipsis,
               textAlign: TextAlign.left,
               style:   TextStyle(
                   color:Colors.white,
                   fontSize: 13,
                   fontWeight: FontWeight.w500),
             ),
           ),
         ),
         Container(

           color: Colors.transparent,
           width: 45,
           margin: EdgeInsets.only(left: 4,right: 0),
           child: Center(
             child: Text(
               "27-10",
               maxLines: 1,
               overflow: TextOverflow.ellipsis,
               textAlign: TextAlign.left,
               style:   TextStyle(
                   color:Colors.white,
                   fontSize: 13,
                   fontWeight: FontWeight.w500),
             ),
           ),
         ),
         Container(

           color: Colors.transparent,
           width: 30,
           margin: EdgeInsets.only(left: 4,right: 0),
           child: Center(
             child: Text(
               "+17",
               maxLines: 1,
               overflow: TextOverflow.ellipsis,
               textAlign: TextAlign.left,
               style:   TextStyle(
                   color:Colors.white,
                   fontSize: 13,
                   fontWeight: FontWeight.w500),
             ),
           ),
         ),
         Container(

           color: Colors.transparent,
           width: 30,
           margin: EdgeInsets.only(left: 4,right: 0),
           child: Center(
             child: Text(
               "30",
               maxLines: 1,
               overflow: TextOverflow.ellipsis,
               textAlign: TextAlign.left,
               style:   TextStyle(
                   color:Colors.white,
                   fontSize: 13,
                   fontWeight: FontWeight.w500),
             ),
           ),
         ),


       ],
     )

       ;
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
                   color:Colors.white,
                   fontSize: 13,
                   fontWeight: FontWeight.w500),
             ),
           ),

           Expanded(child: Row(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
              Container(
             height: 40, width: 40,

             child:ClipRRect(
               borderRadius: BorderRadius.circular(40),
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
               SizedBox(width: 10,),
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
                             color:Colors.white,
                             fontSize: 14,
                             fontWeight: FontWeight.w500),
                       )),

                     ],
                   ),
                   SizedBox(height: 2,),
                   Row(
                     children: [

                       Expanded(child:   Text(
                         "Egyptian footballer",
                         maxLines: 3,
                         overflow: TextOverflow.ellipsis,
                         textAlign: TextAlign.left,
                         style:   TextStyle(
                             color:Colors.white,
                             fontSize: 12,
                             fontWeight: FontWeight.w500),
                       ))
                     ],
                   )
                 ],
               ))


             ],)),

           Container(
             margin: EdgeInsets.only(left: 10,right: 10),
             child: Text(
               "17",
               maxLines: 1,
               overflow: TextOverflow.ellipsis,
               textAlign: TextAlign.right,
               style:   TextStyle(
                   color:Colors.white,
                   fontSize: 15,
                   fontWeight: FontWeight.w500),
             ),
           )
         ],
       ),
     );
   }



}

