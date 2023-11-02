import 'package:flutter/material.dart';

scoreWidget({required String title, required double value}){
  return Container(
    padding:EdgeInsets.fromLTRB(42, 15, 42, 15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title,style: const TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),),
        Text(value.toString(),style: const TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),),
      ],
    ),
  );
}