 import 'package:flutter/material.dart';
import 'package:recipce_app/src/styles/style.dart';

Drawer menuLateral(context){
  return Drawer(
    elevation: 0.0,
    child: Container(
      color: colorBG,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/recipe-slider1.png'),
                fit: BoxFit.cover
                )
            ),
            child: Container(
              alignment: Alignment.center,
              child: Text('Practical Tastes', style: estiloTextomMenuLateral),
            )
            ),
            ListTile(
              leading: Icon(Icons.fastfood,color: colorIcons),
              title: Text('Category'),
              onTap: () {
                Navigator.pushNamed(context, 'categoria');
              },
            ),
             ListTile(
              leading: Icon(Icons.help,color: colorIcons),
              title: Text('Setting'),
              onTap: () {
                Navigator.pushNamed(context, 'categoria');
              },
            ),
      
        ],
      ),
    ),
    
  );
 }