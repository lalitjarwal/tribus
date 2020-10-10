
import 'package:flutter/material.dart';
import 'package:tribus/constants.dart';

class TitleString extends StatelessWidget {
  final String title;
   TitleString(this.title) ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            textScaleFactor: 2,
            style: TextStyle(
              fontWeight:FontWeight.bold,
              color:kBlueColor,
            ),
          ),
          SizedBox(height:7),
          Row(
            mainAxisSize:MainAxisSize.min,
            children:[
              Container(width: 40,height: 7,color: Colors.grey,),
              Container(width: 48,height: 7,color: kBlueColor,),
              Container(width: 40,height: 7,color: Colors.grey,),
            ]
          )
        ],
      ),
    );
  }
}