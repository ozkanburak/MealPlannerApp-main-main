import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:recipce_app/src/provider/recatas_provider.dart';
import 'package:recipce_app/src/styles/style.dart';
import 'package:recipce_app/src/viewModels/recipe_list.dart';
import 'package:recipce_app/src/widget/app_bar.dart';
import 'package:recipce_app/src/widget/menu_lateral.dart';
import 'package:recipce_app/src/widget/swiper_categorie.dart';
import 'package:recipce_app/src/widget/swipper_popular.dart';
import 'package:recipce_app/src/widget/titles.dart';



class HomePage extends StatelessWidget {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();


  @override
  Widget build(BuildContext context) {

    
    
    return Scaffold(
        drawer: menuLateral(context),
        key: _scaffoldKey,
        backgroundColor: colorBG,
        body: CustomScrollView(
          slivers: <Widget>[
            appBar(context, _scaffoldKey),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    children: <Widget> [
                      swiperPopuler(),
                      titles('Category', titleStyle),
                      SwiperCategorie(),
                      titles('Favorite Recipes', titleStyle),
                      FutureBuilder(
                        future: recetasProvider.cargarRecetasPopulares(), 
                        initialData: [],
                        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){
                          return Column(
                            children: recetasListado(context, snapshot.data??[]),
                          );
                        }
                        )
                    ],
                  )
                ]
              )
              )

          ],
        )
      );
  }
}