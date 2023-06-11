import 'package:flutter/material.dart';


class Search extends StatelessWidget {
  const Search({super.key});

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
          body: Center(
            child: Text("Search",
            style: Theme.of(context).textTheme.headline6!.copyWith(
              fontWeight: FontWeight.bold
            ),),
          ),
        ),
      ),
    );
  }
}
