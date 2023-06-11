import 'package:demo_music_app/audio_player_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';
import 'controller.dart';
class Trending extends StatelessWidget {
  const Trending({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    AudioController audioController = Get.put(AudioController());
    return  Obx(() => Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Icon(Icons.menu,size: 40,),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 30
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Trending right now",
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(

              height: MediaQuery.of(context).size.height*0.25,
              child: ListView.builder(
                  itemCount: 20,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>  Stack(
                      children: [Container(
                        width: 200,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image:const DecorationImage(image:  AssetImage("assets/images/1.jpg"),
                              fit: BoxFit.cover
                          ),

                        ),


                      ),
                        Positioned(
                          bottom: 40,
                          right: 10,
                          left: 10,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.deepPurpleAccent.withOpacity(0.2),
                            ),

                            height: 30,
                            child: const ListTile(
                              title: Text("rock and roll"),
                              subtitle: Text("Rock"),
                              trailing: Icon(Icons.play_circle_fill,
                                  size: 40),
                            ),

                          ),
                        )
                      ]
                  )),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height*0.10,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: List.generate(homeController.categoryList.length, (index) =>
                          GestureDetector(
                            onTap: () {
                            homeController.currentIndex.value = index;
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    color: homeController.currentIndex.value==index?Colors.lightBlue:Colors.deepPurpleAccent,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                                child: Text(homeController.categoryList[index])
                            ),
                          ))
                  ),
                )
            ),
            GetBuilder(
              init: AudioController(),
              builder: (controller) =>   SizedBox(
              height: MediaQuery.of(context).size.height*0.35,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder:
                    (context, index) =>
                        ListTile(
                          onTap: () {
                            audioController.playAudio(index);

                          },
                          leading: Image.asset("assets/images/1.jpg",
                              height: 40),
                          title: Text("I am good(Blue)"),
                          subtitle: Text("count"),
                          trailing: audioController.isPlaying[index]? Icon(Icons.pause_circle,
                            size: 40,
                          ):Icon(Icons.play_circle_fill,
                            size: 40,
                          ),
                        ),

              ),
            ),)



          ],
        ),
      ),
    ));
  }
}
