
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class  TopGoalScrorerPlayerListPageViewController extends GetxController with GetTickerProviderStateMixin{
  late TabController tabController ;
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, initialIndex:0 ,length: 3);


  }

}