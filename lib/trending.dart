import 'package:flutter/material.dart';

class Trending extends StatefulWidget {
  const Trending({super.key});

  @override
  State<Trending> createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  var _currentIndex = 0;
  final List<String> _categoryList = const ["Treending right now","Rock","Hip Hop","Electro"];

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("Trending right now",
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(

              height: MediaQuery.of(context).size.height*0.35,
              child: ListView.builder(
                  itemCount: 20,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>  Stack(
                      children: [Container(
                        width: 200,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image:DecorationImage(image:  AssetImage("assets/images/1.jpg"),
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
                            child: ListTile(
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
                      children: List.generate(_categoryList.length, (index) =>
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _currentIndex = index;
                              });
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    color: _currentIndex==index?Colors.lightBlue:Colors.deepPurpleAccent,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                                child: Text(_categoryList[index])
                            ),
                          ))
                  ),
                )
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.35,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder:
                    (context, index) =>
                    ListTile(
                      leading: Image.asset("assets/images/1.jpg",
                          height: 40),
                      title: Text("I am good(Blue)"),
                      subtitle: Text("count"),
                      trailing: Icon(Icons.favorite_border,
                        size: 40,
                      ),
                    )
                ,
              ),
            )



          ],
        ),
      ),
    );
  }
}
