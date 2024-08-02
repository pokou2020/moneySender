import 'package:flutter/material.dart';



class MyAppBar extends StatelessWidget {

  final double barHeight = 66.0;

  const MyAppBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
  
        children: <Widget>[

          Container(child: Padding(
            padding: const EdgeInsets.all(16.0),
            child:Icon(Icons.search),
          ),),

        ],
      ),
    );
  }
}