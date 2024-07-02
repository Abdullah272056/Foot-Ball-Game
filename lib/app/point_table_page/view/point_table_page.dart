
import 'package:flag/flag_enum.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../constant/Colors.dart';
import '../../../utils/assets.dart';
import '../controller/point_table_page_controller.dart';


class PointTableScreenPage extends StatelessWidget {
   final pageController = Get.put(PointTablePageController());
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
                 "Point Table",
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


          ///Home section
          Expanded(child: Column(
            children: [
              // SizedBox(height: 10,),
              // Row(
              //   children: [
              //     Expanded(child: standingListItemTitle( ),)
              //   ],
              // ),
              SizedBox(height: 10,),
              // Row(
              //   children: [
              //     Expanded(child:   Text(
              //       "PREMIER LEAGUE -ROUND 0",
              //       maxLines: 3,
              //       overflow: TextOverflow.ellipsis,
              //       textAlign: TextAlign.center,
              //       style:   TextStyle(
              //           color:Colors.white,
              //           fontSize: 13,
              //           fontWeight: FontWeight.w400),
              //     )),
              //
              //   ],
              // ),
              // SizedBox(height: 5,),


              Expanded(
                  child:
                  ListView.builder(
                  padding: EdgeInsets.only(bottom: 20 ,top: 5 ),
                  itemCount: 8,
                  itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: Container(
                            margin: EdgeInsets.only(left: 0.w,bottom: 20.h),
                            child: Text("GROUP ${pageController.textCharacter[index].toUpperCase()}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: textColor,
                                  fontSize: 16 ,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                        ],
                      ),

                      Row(
                        children: [
                          Expanded(child: standingListItemTitle( ),),
                          SizedBox(width: 5.w,)
                        ],
                      ),
                      // SizedBox(height: 10,),
                      ListView.builder(
                          padding: EdgeInsets.only(bottom: 20.h ,top: 5.h,left: 5.w,right: 5.w ),
                          itemCount: 4,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return standingListItem( index);
                          })
                    ],
                  );
                  }),




              ),
            ],
          )),


        ],
      );
  }



   ///TODO: list view item

   Widget standingListItem(int index ){
     return Container(
       decoration: BoxDecoration(
           border: Border(
             top: BorderSide(
               color: Colors.black26, // Border color
               width: 0.5.w, // Border width
             ),
           ),
       ),
       child: Row(
         children: [
           Container(

             decoration: BoxDecoration(
               color:index<2? Colors.green:Colors.transparent,

           ),

             height: 45.h,
             margin: EdgeInsets.only(left: 0,right: 5.w,top: 1.h,bottom: 1.h),
             padding: EdgeInsets.only(left: 6.w,right: 6.w),



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
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Container(
                 height: 17.h,
                 width: 22.w,
                 child: ClipRRect(
                   borderRadius: BorderRadius.circular(2.r),
                   child: Flag.fromCode(
                     FlagsCode.PT,
                     height: 17.h,
                     width: 22.w,
                     fit: BoxFit.fill,
                   ),
                 ),
               ),
               SizedBox(width: 5.w,),
               Expanded(child:   Text(
                 "Portugal",
                 maxLines: 3,
                 overflow: TextOverflow.ellipsis,
                 textAlign: TextAlign.left,
                 style:   TextStyle(
                     color:Colors.black,
                     fontSize: 13.sp,
                     fontWeight: FontWeight.w500),
               )),


             ],)),

           Container(

             color: Colors.transparent,
             width: 22.w,
             margin: EdgeInsets.only(left: 4,right: 0),
             child: Center(
               child: Text(
                 "13",
                 maxLines: 1,
                 overflow: TextOverflow.ellipsis,
                 textAlign: TextAlign.left,
                 style:   TextStyle(
                     color:Colors.black,
                     fontSize: 13.sp,
                     fontWeight: FontWeight.w500),
               ),
             ),
           ),
           Container(

             color: Colors.transparent,
             width: 22.w,
             margin: EdgeInsets.only(left: 4,right: 0),
             child: Center(
               child: Text(
                 "9",
                 maxLines: 1,
                 overflow: TextOverflow.ellipsis,
                 textAlign: TextAlign.left,
                 style:   TextStyle(
                     color:Colors.black,
                     fontSize: 13.sp,
                     fontWeight: FontWeight.w500),
               ),
             ),
           ),
           Container(

             color: Colors.transparent,
             width: 22.w,
             margin: EdgeInsets.only(left: 4,right: 0),
             child: Center(
               child: Text(
                 "3",
                 maxLines: 1,
                 overflow: TextOverflow.ellipsis,
                 textAlign: TextAlign.left,
                 style:   TextStyle(
                     color:Colors.black,
                     fontSize: 13.sp,
                     fontWeight: FontWeight.w500),
               ),
             ),
           ),
           Container(

             color: Colors.transparent,
             width: 22.w,
             margin: EdgeInsets.only(left: 4,right: 0),
             child: Center(
               child: Text(
                 "1",
                 maxLines: 1,
                 overflow: TextOverflow.ellipsis,
                 textAlign: TextAlign.left,
                 style:   TextStyle(
                     color:Colors.black,
                     fontSize: 13.sp,
                     fontWeight: FontWeight.w500),
               ),
             ),
           ),
           Container(

             color: Colors.transparent,
             width: 45.w,
             margin: EdgeInsets.only(left: 4,right: 0),
             child: Center(
               child: Text(
                 "27-10",
                 maxLines: 1,
                 overflow: TextOverflow.ellipsis,
                 textAlign: TextAlign.left,
                 style:   TextStyle(
                     color:Colors.black,
                     fontSize: 13.sp,
                     fontWeight: FontWeight.w500),
               ),
             ),
           ),
           Container(

             color: Colors.transparent,
             width: 30.w,
             margin: EdgeInsets.only(left: 4,right: 0),
             child: Center(
               child: Text(
                 "+17",
                 maxLines: 1,
                 overflow: TextOverflow.ellipsis,
                 textAlign: TextAlign.left,
                 style:   TextStyle(
                     color:Colors.black,
                     fontSize: 13.sp,
                     fontWeight: FontWeight.w500),
               ),
             ),
           ),
           Container(

             color: Colors.transparent,
             width: 30.w,
             margin: EdgeInsets.only(left: 4,right: 0),
             child: Center(
               child: Text(
                 "30",
                 maxLines: 1,
                 overflow: TextOverflow.ellipsis,
                 textAlign: TextAlign.left,
                 style:   TextStyle(
                     color:Colors.black,
                     fontSize: 13.sp,
                     fontWeight: FontWeight.w500),
               ),
             ),
           ),


         ],
       ),
     )

     ;
   }

   Widget standingListItemTitle( ){
     return Row(
       children: [
         Expanded(child: Container(
           margin: EdgeInsets.only(left: 35.w),
           child: Text("Team",
             textAlign: TextAlign.left,
             style: TextStyle(
                 color: textColor,
                 fontSize: 13.sp ,
                 decoration: TextDecoration.none,
                 fontWeight: FontWeight.w500),
           ),
         )),

         Container(

           color: Colors.transparent,
           width: 22.w,
           margin: EdgeInsets.only(left: 4.w,right: 0),
           child: Center(
             child: Text(
               "GP",
               maxLines: 1,
               overflow: TextOverflow.ellipsis,
               textAlign: TextAlign.left,
               style:   TextStyle(
                   color:textColor,
                   fontSize: 13.sp,
                   fontWeight: FontWeight.w500),
             ),
           ),
         ),
         Container(

           color: Colors.transparent,
           width: 22.w,
           margin: EdgeInsets.only(left: 4,right: 0),
           child: Center(
             child: Text(
               "W",
               maxLines: 1,
               overflow: TextOverflow.ellipsis,
               textAlign: TextAlign.left,
               style:   TextStyle(
                   color:textColor,
                   fontSize: 13.sp,
                   fontWeight: FontWeight.w500),
             ),
           ),
         ),
         Container(

           color: Colors.transparent,
           width: 22.w,
           margin: EdgeInsets.only(left: 4,right: 0),
           child: Center(
             child: Text(
               "D",
               maxLines: 1,
               overflow: TextOverflow.ellipsis,
               textAlign: TextAlign.left,
               style:   TextStyle(
                   color:textColor,
                   fontSize: 13.sp,
                   fontWeight: FontWeight.w500),
             ),
           ),
         ),
         Container(

           color: Colors.transparent,
           width: 22.w,
           margin: EdgeInsets.only(left: 4,right: 0),
           child: Center(
             child: Text(
               "L",
               maxLines: 1,
               overflow: TextOverflow.ellipsis,
               textAlign: TextAlign.left,
               style:   TextStyle(
                   color:textColor,
                   fontSize: 13.sp,
                   fontWeight: FontWeight.w500),
             ),
           ),
         ),
         Container(

           color: Colors.transparent,
           width: 45.w,
           margin: EdgeInsets.only(left: 4,right: 0),
           child: Center(
             child: Text(
               "GF-GA",
               maxLines: 1,
               overflow: TextOverflow.ellipsis,
               textAlign: TextAlign.left,
               style:   TextStyle(
                   color:textColor,
                   fontSize: 13.sp,
                   fontWeight: FontWeight.w500),
             ),
           ),
         ),
         Container(

           color: Colors.transparent,
           width: 30.w,
           margin: EdgeInsets.only(left: 4,right: 0),
           child: Center(
             child: Text(
               "GD",
               maxLines: 1,
               overflow: TextOverflow.ellipsis,
               textAlign: TextAlign.left,
               style:   TextStyle(
                   color:textColor,
                   fontSize: 13.sp,
                   fontWeight: FontWeight.w500),
             ),
           ),
         ),
         Container(

           color: Colors.transparent,
           width: 30.w,
           margin: EdgeInsets.only(left: 4,right: 0),
           child: Center(
             child: Text(
               "PTS",
               maxLines: 1,
               overflow: TextOverflow.ellipsis,
               textAlign: TextAlign.left,
               style:   TextStyle(
                   color:textColor,
                   fontSize: 13.sp,
                   fontWeight: FontWeight.w500),
             ),
           ),
         ),


       ],
     )

     ;
   }


}

