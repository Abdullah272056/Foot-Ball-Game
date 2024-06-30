
import 'package:flag/flag_enum.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../constant/Colors.dart';
import '../../../utils/assets.dart';
import '../controller/all_player_list_page_controller.dart';


class AppPlayerListScreenPage extends StatelessWidget {
   final pageController = Get.put(AppPlayerListPageController());
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
              Expanded(child: Container(
                  padding: EdgeInsets.only(top: 5.h),
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
                 "All Player List",
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


          Expanded(child: GridView.builder(
            padding: EdgeInsets.only(left: 10.w,right: 10.w),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0.h,
              mainAxisSpacing: 10.0.w,
              mainAxisExtent: 260.h,

            ),
            itemCount: 30, // Number of items in the grid
            itemBuilder: (context, index) {
              return playerListItem();
            },
          ))



        ],
      );
  }

   ///  list item design
   Widget playerListItem () {
     return Container(


       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(10.r),
         border:Border.all(
             width: 1.w,
             color: Colors.black38
         ) ,
         // color:shimmerBackgroundBaseColor,
         color: Colors.white,
         boxShadow: [
           BoxShadow(
             color: Colors.grey.withOpacity(0.3),
             spreadRadius: 1,
             blurRadius: 1,
             offset: Offset(0, 2),
           ),
         ],
       ),
       // padding: EdgeInsets.all(10),
       // margin: EdgeInsets.symmetric(vertical: 5),
       child: ClipRRect(
         borderRadius: BorderRadius.circular(10.r),
         child: Column(
           children: [

             Row(
               children: [
                 Expanded(child: Container(
                   decoration: BoxDecoration(
                       color: Colors.grey
                   ),
                   height: 150.h,
                   child: FadeInImage.assetNetwork(
                     fit: BoxFit.fitWidth,
                     placeholder: Assets.profileAvater,
                     image:"https://img.uefa.com/imgml/TP/players/3/2024/cutoff/63706.png",
                     imageErrorBuilder: (context, url, error) =>
                         Image.asset(
                           Assets.profileAvater,
                           fit: BoxFit.fill,
                         ),
                   ),
                 ))
               ],
             ),

             Expanded(child: Padding(
               padding: EdgeInsets.only(left: 8.w,
                   right: 8.w,bottom: 8.h,
                 top: 7.h
               ),
               child: Column(
                 children: [
                   Row(
                     children: [
                       Expanded(child: Text(
                         "Cristiano Ronaldo",
                         maxLines: 2,
                         overflow: TextOverflow.ellipsis,
                         textAlign: TextAlign.left,
                         style:   TextStyle(
                             color:Colors.black,
                             fontSize: 15,
                             fontWeight: FontWeight.bold),
                       ))
                     ],
                   ),

                   Row(
                     children: [
                       Expanded(child: Text(
                         "Forward",
                         maxLines: 1,
                         overflow: TextOverflow.ellipsis,
                         textAlign: TextAlign.left,
                         style:   TextStyle(
                             color:Colors.black54,
                             fontSize: 15,
                             fontWeight: FontWeight.normal),
                       ))
                     ],
                   ),
                   Expanded(child: Container()),

                   Row(
                     children: [
                       ClipRRect(
                         borderRadius: BorderRadius.circular(2.r),
                         child: Flag.fromCode(
                           FlagsCode.PT,
                           height: 15.h,
                           width: 20.w,
                           fit: BoxFit.fill,
                         ),
                       ),
                       SizedBox(width: 5.w,),
                       Expanded(child: Text(
                         "Portugal ",
                         maxLines: 1,
                         overflow: TextOverflow.ellipsis,
                         textAlign: TextAlign.left,
                         style:   TextStyle(
                             color:Colors.black87,
                             fontSize: 15,
                             fontWeight: FontWeight.normal),
                       ))
                     ],
                   ),
                 ],
               ),

             )),



           ],
         ),
       ),
     );
   }



}

