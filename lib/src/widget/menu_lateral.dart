 import 'package:flutter/material.dart';
import 'package:recipce_app/src/pages/bilgi_sayfasi.dart';
import 'package:recipce_app/src/pages/catergoria_page.dart';
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
                image: AssetImage('assets/foodicon.png'),
                fit: BoxFit.contain
                )
            ), child: null,
            
            
            ),
            ListTile(
              leading: Icon(Icons.fastfood,color: colorIcons),
              title: Text('Category'),
              onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CategorieDrawer()),
            );
              },
            ),
             ListTile(
              leading: Icon(Icons.help,color: colorIcons),
              title: Text('Setting'),
              onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BilgiSayfasi()),
            );
              },
            ),
      
        ],
      ),
    ),
    
  );
 }