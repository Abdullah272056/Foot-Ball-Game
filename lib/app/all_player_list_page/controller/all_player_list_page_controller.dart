

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/all_player_list_model.dart';


class  AllPlayerListPageController extends GetxController {
  final int _limit = 10; // Number of documents to fetch per page
  DocumentSnapshot? _lastDocument;
  late ScrollController _scrollController;
  late List<DocumentSnapshot> _documents = [];
  var isLoading = false.obs;


  var playerList=<AllPlayerListModel>[].obs;


  @override
  void onInit() {
    super.onInit();

    _scrollController = ScrollController()..addListener(_scrollListener);
    _fetchData();
  }


  Future<void> _fetchData() async {
    if (!isLoading.value) {

      isLoading(true);


      QuerySnapshot querySnapshot;
      if (_lastDocument == null) {
        querySnapshot = await FirebaseFirestore.instance
            .collection('all_player_list')
            .orderBy('name') // Replace 'field' with your sorting field
            .limit(_limit)
            .get();
      } else {
        querySnapshot = await FirebaseFirestore.instance
            .collection('all_player_list')
            .orderBy('name') // Replace 'field' with your sorting field
            .startAfterDocument(_lastDocument!)
            .limit(_limit)
            .get();
      }

      if (querySnapshot.docs.isNotEmpty) {

        print("ssss");
           isLoading(false);
          _documents.addAll(querySnapshot.docs);
          _lastDocument = querySnapshot.docs.last;
        addDataIntoList();

      } else {

        isLoading(false);

      }
    }
  }
  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      _fetchData();
    }
  }


  addDataIntoList(){

    for(int i=0; i<_documents.length;  i++){
      final document = _documents[i];
      final playerData = document.data() as Map<String, dynamic>?;
      playerList.add(
          AllPlayerListModel(
              playerCountryName: playerData?['country_name'] ?? '',
              playerCountryCode: playerData?['country_short_name'] ?? '',
              playerImageUrl: playerData?['image_url'] ?? '',
              playerName: playerData?['name'] ?? '',
              playerPlayedPosition:playerData?['played_position'] ?? '',
            playerProfileUrl:playerData?['player_profile_link'] ?? '',

      ));

    }

    print("length== ${playerList.length}");

  }


  Future<void> myUrlLaunch({required String url} ) async {
    print(url);
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  }







