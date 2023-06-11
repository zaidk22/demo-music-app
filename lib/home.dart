import 'package:demo_music_app/controller.dart';
import 'package:demo_music_app/favorite.dart';
import 'package:demo_music_app/music.dart';
import 'package:demo_music_app/search.dart';
import 'package:demo_music_app/trending.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

   @override
  Widget build(BuildContext context) {
     HomeController homeController = Get.put(HomeController());
    return Obx(() => Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                Colors.lightBlue.shade600,
                Colors.lightBlue.shade900
              ]
          )
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: Container(
            padding: EdgeInsets.all(20),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                  Radius.circular(30)
              ),
              child: BottomNavigationBar(
                  currentIndex: homeController.pageIndex.value,
                  onTap: (int index) {

                    homeController.pageIndex.value = index;
                    // setState(() {
                    //   _pageIndex= index;
                    // });
                    //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$index")));
                  },
                  elevation: 0,
                  backgroundColor: Colors.blueAccent,
                  unselectedItemColor: Colors.white,
                  selectedItemColor: Colors.white,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  items: const [
                    BottomNavigationBarItem(icon: Icon(Icons.home,
                      color: Colors.lightBlue,
                    ),label: "Home",),
                    BottomNavigationBarItem(icon: Icon(Icons.search,color: Colors.lightBlue,),label: "Search",),
                    BottomNavigationBarItem(icon: Icon(Icons.music_note,color: Colors.lightBlue,),label: "Music",),
                    BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.lightBlue,),label: "Favorite",)
                  ]),
            ),
          ),
          appBar: null,
          body: homeController.tabList.elementAt(homeController.pageIndex.value),
          //body: _tabList.elementAt(_pageIndex)
      ),
    ));
  }
}

class _customAppBar extends StatelessWidget with PreferredSizeWidget{
  const _customAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Icon(Icons.menu),
      actions: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 50,
              vertical: 10
            ),
            child:
              TextFormField(
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  hintText: "Search",
                  fillColor: Colors.blueAccent.shade700.withOpacity(0.3),
                  hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white,

                  ),
                  prefixIcon: Icon(Icons.search,color: Colors.blue,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none
                  )

                ),
              ),

          ),
        )
      ],
    );
  }

  @override

  Size get preferredSize => const Size.fromHeight(70);
}
