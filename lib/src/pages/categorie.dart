import 'package:flutter/material.dart';
import 'package:recipce_app/src/provider/recatas_provider.dart';
import 'package:recipce_app/src/styles/style.dart';
import 'package:recipce_app/src/viewModels/recipe_list.dart';
import 'package:recipce_app/src/widget/app_bar_categori.dart';
import 'package:recipce_app/src/widget/menu_lateral.dart';
import 'package:recipce_app/src/widget/swipper_popular.dart';
import 'package:recipce_app/src/widget/titles.dart';
import 'package:recipce_app/src/widget/app_bar_categori.dart';

class CategoriPage extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

      final Map<String, dynamic> categoria = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          appBarCategori(categoria['nombre']),
          SliverList(
            delegate: SliverChildListDelegate([
              titles(categoria['nombre'], titleStyleCategorie),
              FutureBuilder(
                future: recetasProvider.cargarRecetaCategorias(categoria['nombre']), 
                initialData: [],
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  return Column(
                    children: recetasListado(context, snapshot.data??[]),
                 );
                }
                )
            ]
            )
            )
        
        ],


      ),
    );
  }
}
