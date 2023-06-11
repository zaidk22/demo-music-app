import 'package:demo_music_app/search.dart';
import 'package:demo_music_app/trending.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'favorite.dart';
import 'music.dart';

class HomeController extends GetxController {
  RxInt pageIndex = 0.obs;
   List<Widget> tabList = [Trending(),Search(),MusicScreen(),Favourite()].obs;
  RxInt  currentIndex = 0.obs;
   List<String> categoryList = const ["Treending right now","Rock","Hip Hop","Electro"].obs;


}