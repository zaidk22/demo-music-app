import 'package:flutter/material.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Container(
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
          appBar: null,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.arrow_back_ios_new,size: 30,color: Colors.white,),
                    Icon(Icons.favorite_border,size: 30,color: Colors.white,)
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Recent favourites",
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2),
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height*0.30,
                        child: Column(

                          children: [
                            Container(

                              child: Image.asset("assets/images/1.jpg",
                                height: MediaQuery.of(context).size.height*0.20,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Text("Bright Hits",
                            style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontWeight: FontWeight.bold
                            ),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),

                      );
                    },),
              )
            ],
          ),
        ),
      ),
    );
  }
}
