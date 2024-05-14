import 'package:flutter/material.dart';
import 'package:recipce_app/src/styles/style.dart';
import 'package:recipce_app/src/widget/app_bar.dart';
import 'package:recipce_app/src/widget/app_bar_categori.dart';
import 'package:recipce_app/src/widget/swiper_categorie.dart';
import 'package:recipce_app/src/widget/swiper_categorie_drawer.dart';
import 'package:recipce_app/src/widget/titles.dart';

class CategorieDrawer extends StatelessWidget {
  
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: colorBG,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Geri dönüş ikonu beyaz renkte
          onPressed: () {
            Navigator.of(context).pop(); // Geri dönüş işlemi
          },
        ),
        title: Text('Categorie',style: TextStyle(color: Colors.white)), // AppBar başlığı
        backgroundColor: Colors.deepOrangeAccent, // AppBar arka plan rengi
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(2.0), // Tüm içerik için dış boşluk
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10), // Aradaki boşluğu artırabilirsiniz.
                    CategorieListView(),
                  ],
                ),
              )
            ])
          )
        ],
      ),
    );
  }
}