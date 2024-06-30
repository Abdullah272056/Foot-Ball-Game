
import 'package:flag/flag_enum.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import '../../../../../constant/Colors.dart';
import '../../../utils/assets.dart';
import '../controller/all_match_list_page_controller.dart';


class AllMatchListScreenPage extends StatelessWidget {
   final pageController = Get.put(AllMatchListPageController());
   late BuildContext mContext;
   final GlobalKey<ScaffoldState>  drawerKey = GlobalKey();



  @override
  Widget build(BuildContext context) {
    mContext=context;
    final size = MediaQuery.of(context).size;
    return
      Scaffold(

        backgroundColor: titleBarBgColor,
        body:SafeArea(


          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ///title bar design
              titleBarDesign(),

              ///body design
              Expanded(child: ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15.r),topRight: Radius.circular(15.r)),

                child: Container(
                    padding: EdgeInsets.only(top: 0.h),
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: bgColor,

                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15.r),topRight: Radius.circular(15.r)),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.grey.withOpacity(0.5),
                      //     spreadRadius: 2,
                      //     blurRadius: 7,
                      //     offset: Offset(0, -3), // Negative y-value for top shadow
                      //   ),
                      // ],
                    ),

                    child:bodyDesign()
                ),
              )),
            ],
          ),
        ),




      )

      ;


  }



   ///-----------page title bar design
   Widget titleBarDesign(){
     return  Container(
       color: titleBarBgColor,
       child: Column(

         children: [
           SizedBox(height: 3.h,),
           Row(
             children: [
               SizedBox(width: 15.w,),
               IconButton(
                 onPressed: (){

                   if (drawerKey.currentState!.isDrawerOpen) {

                     drawerKey.currentState!.openEndDrawer();
                     return;
                   } else{
                     drawerKey.currentState!.openDrawer();
                   }
                 },
                 icon: Icon(Icons.arrow_back_ios_new,size: 25.sp,
                   color: titleBarContentColor,
                 ),
               ),
               SizedBox(width: 15.w,),
               Expanded(child:  Text(
                 "All Match List",
                 textAlign: TextAlign.left,
                 style:   TextStyle(
                   fontFamily: 'PT-Sans',
                   fontSize: 18.sp,
                   fontWeight: FontWeight.w500,
                   color:titleBarContentColor,
                 ),)),



             ],
           ),
           SizedBox(height: 7.h,),
         ],
       ),
     );
   }



  ///-----------page body design
  Widget bodyDesign(){

    return
      Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [


          Expanded(child:  ///schedule section
          categoryItemSchedule(),)



        ],
      );
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
                           padding:   EdgeInsets.only(left: 12.w,top: 8.h,bottom: 8.h,right: 10.w ),
                           child: Row(
                             children: [

                               Expanded(child: Text("Group Stage",
                                 style: TextStyle(
                                     color: Colors.black,
                                     fontSize: 14.sp ,
                                     decoration: TextDecoration.none,
                                     fontWeight: FontWeight.w500),
                               )),

                               Text("ROUND ${index+1}",
                                 style: TextStyle(
                                     color: Colors.black,
                                     fontSize: 14.sp ,
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
       margin: EdgeInsets.only(top: 5.h,left: 10.w,right: 10.w,bottom: 5.h),
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(7.r),
         border: Border.all(width: 1.w,
         color: Colors.black12
         )
       ),
       padding: EdgeInsets.only(top: 15,bottom: 15,left: 10,right: 10),
       child:Column(
         children: [


          Row(
            children: [
              Expanded(child: Column(children: [

                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(2.r),
                      child: Flag.fromCode(
                        FlagsCode.PT,
                        height: 17.h,
                        width: 22.w,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(width: 7.w,),
                    Expanded(child: Text(
                      "Portugal",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style:   TextStyle(
                          color:Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    )),

                    SizedBox(width: 10.w,),
                    Text(
                      "4",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style:   TextStyle(
                          color:Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    )

                  ],
                ),
                SizedBox(height: 15.h,),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(2.r),
                      child: Flag.fromCode(
                        FlagsCode.BR,
                        height: 17.h,
                        width: 22.w,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(width: 7.w,),
                    Expanded(child: Text(
                      "Brazil",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style:   TextStyle(
                          color:Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    )),

                    SizedBox(width: 10.w,),
                    Text(
                      "2",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style:   TextStyle(
                          color:Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    )

                  ],
                ),
              ],)),


              Container(
                height: 60.h,
                margin: EdgeInsets.only(left: 15.w,right: 5.w),
                width: 1.w,
                color: Colors.black12,
              ),


              Container(
                width: 90.w,
                margin: EdgeInsets.only(left: 5.w,right: 5.w),

                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text(
                          "Today",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style:   TextStyle(
                              color:Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        )),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: Text(
                          "Thu, Jul 12",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style:   TextStyle(
                              color:Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.normal),
                        )),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: Text(
                          "6:00 AM",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style:   TextStyle(
                              color:Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.normal),
                        )),
                      ],
                    ),
                  ],
                ),
              )


            ],
          )

           // Row(
           //   children: [
           //     Icon(Icons.notifications_rounded,size: 18,color: Colors.black,),
           //     SizedBox(
           //       width: 10,
           //     ),
           //
           //     Expanded(child: Row(
           //       mainAxisAlignment: MainAxisAlignment.end,
           //
           //       children: [
           //         Expanded(child:   Text(
           //           "Bashundhara Kings",
           //           maxLines: 3,
           //           overflow: TextOverflow.ellipsis,
           //           textAlign: TextAlign.right,
           //           style:   TextStyle(
           //               color:Colors.black,
           //               fontSize: 14,
           //               fontWeight: FontWeight.w400),
           //         )),
           //         SizedBox(width: 3,),
           //         Container(
           //           height: 25, width: 25,
           //
           //           child:ClipRRect(
           //             borderRadius: BorderRadius.circular(25), // Adjust the radius to control the rounding
           //             child:FadeInImage.assetNetwork(
           //               fit: BoxFit.fill,
           //               placeholder: Assets.profileAvater,
           //               image:"https://ssl.gstatic.com/onebox/media/sports/logos/8NSdffH3dYyTy5jLBAKDZA_96x96.png",
           //               imageErrorBuilder: (context, url, error) =>
           //                   Image.asset(
           //                     Assets.profileAvater,
           //                     fit: BoxFit.fill,
           //                   ),
           //             ),
           //
           //
           //           ),
           //         ),
           //
           //       ],)),
           //
           //     SizedBox(width: 5,),
           //     Column(
           //       children: [
           //         Row(
           //           children: [
           //             Text(
           //               "3 - 1",
           //               maxLines: 3,
           //               overflow: TextOverflow.ellipsis,
           //               textAlign: TextAlign.center,
           //               style:   TextStyle(
           //                   color:Colors.black,
           //                   fontSize: 12,
           //                   fontWeight: FontWeight.normal),
           //             )
           //           ],
           //         ),
           //         SizedBox(height: 3,),
           //         Row(
           //           children: [
           //             Text(
           //               "6:30Pm",
           //               maxLines: 1,
           //               overflow: TextOverflow.ellipsis,
           //               textAlign: TextAlign.center,
           //               style:   TextStyle(
           //                   color:Colors.green,
           //                   fontSize: 12,
           //                   fontWeight: FontWeight.bold),
           //             )
           //           ],
           //         ),
           //       ],
           //     ),
           //
           //     SizedBox(width: 5,),
           //
           //
           //     Expanded(child: Row(
           //       mainAxisAlignment: MainAxisAlignment.end,
           //       children: [
           //         Container(
           //           height: 25, width: 25,
           //
           //           child:ClipRRect(
           //             borderRadius: BorderRadius.circular(25), // Adjust the radius to control the rounding
           //             child:FadeInImage.assetNetwork(
           //               fit: BoxFit.fill,
           //               placeholder: Assets.profileAvater,
           //               image:"https://ssl.gstatic.com/onebox/media/sports/logos/paYnEE8hcrP96neHRNofhQ_96x96.png",
           //               imageErrorBuilder: (context, url, error) =>
           //                   Image.asset(
           //                     Assets.profileAvater,
           //                     fit: BoxFit.fill,
           //                   ),
           //             ),
           //
           //
           //           ),
           //         ),
           //         SizedBox(width: 3,),
           //
           //         Expanded(child:   Text(
           //           "Abahani Limited Dhaka",
           //           maxLines: 3,
           //           overflow: TextOverflow.ellipsis,
           //           textAlign: TextAlign.left,
           //           style:   TextStyle(
           //               color:Colors.black,
           //               fontSize: 14,
           //               fontWeight: FontWeight.w400),
           //         ))
           //       ],)),
           //
           //     Icon(Icons.arrow_right,size: 18,color: Colors.black,)
           //   ],
           // )
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
                   color:Colors.black,
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
                   color: Colors.black,
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
                   color:Colors.black,
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
                   color:Colors.black,
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
                   color:Colors.black,
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
                   color:Colors.black,
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
                   color:Colors.black,
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
                   color:Colors.black,
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
                   color:Colors.black,
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
                   color:Colors.black,
                   fontSize: 13,
                   fontWeight: FontWeight.w500),
             ),
           ),
         ),


       ],
     )

     ;
   }

}

