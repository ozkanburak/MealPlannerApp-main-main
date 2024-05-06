import 'package:flutter/material.dart';
import 'package:recipce_app/src/styles/style.dart';

Widget appBarCategori(String title){
  return SliverAppBar(
    backgroundColor: colorBG,
    floating: false,
    pinned: true,
    elevation: 0.0,
    // title: Text(title, style: TextStyle(
    //   fontFamily: 'PlayfairDisplay-Bold', 
    //   fontWeight: FontWeight.bold,
    //   color: colorTitle,

    // )),
    iconTheme: IconThemeData(
      color:colorIconsAppBar
    ),

  );
}