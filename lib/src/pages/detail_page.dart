import 'package:flutter/material.dart';
import 'package:recipce_app/src/styles/style.dart';
import 'package:recipce_app/src/widget/app_bar_detail.dart';
import 'package:recipce_app/src/widget/swiper_ingredients.dart';

import 'package:recipce_app/src/widget/titles.dart';

class DetailPage extends StatelessWidget {

 
  @override
  Widget build(BuildContext context) {

    final Map<String, dynamic> receta = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      backgroundColor: colorBG,
      body: CustomScrollView(
        slivers: <Widget>[
          appBarDetail(receta['foto']),
          SliverList(delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
              child: _cuerpoReceta(receta),
            ),
            titles('Ingredientes', titleStyle),
             SizedBox(height: 20.0,
            ), 
            SliderIngrediente(receta['ingredientes']),
            SizedBox(height: 20.0,
            ), 
            titles('Detail', titleStyle),
            _textDescription(receta['preparacion']),
          ]))
        ],
        


      ),
    );
  }
  
  
}

Widget _cuerpoReceta(Map<String,dynamic> receta){
  return Container(
        alignment: AlignmentDirectional.topStart,
        margin: EdgeInsets.only(left: 30.0, top: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
            receta['titulo'],
            textAlign: TextAlign.left,
            style: titleStyleCategorie,
            ),
            Text(
            receta['descripcion'],
            textAlign: TextAlign.left,
            style: titleRecipeStyleDetail,
            maxLines: 8,
            ),
            SizedBox(height: 5.0,
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.alarm,
                          color: colorIcons,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5.0),
                          child: Text(
                          receta['duracion'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: colorTitle,
                            fontSize: 14.0,


                          ),
                          ),
                        )

                      ],
                    )
                    ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.fastfood,
                          color: colorIcons,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5.0),
                          child: Text(
                          receta['dificultad'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: colorTitle,
                            fontSize: 14.0,


                          ),
                          ),
                        )

                      ],
                    )
                    )
                ],
              ),

            ),
          ],
        ),
      );
}
Widget _textDescription(String texto) {
  return Container(
    margin: EdgeInsets.only(top: 5.0, left: 30.0, right: 30.0),
    child: Text(
      texto, 
      textAlign: TextAlign.left,
      style: TextStyle(
        fontFamily: 'Avenir',
        fontWeight: FontWeight.normal,
        color: Color.fromRGBO(15, 55, 91, 1),
        fontSize: 14.0

    ),),
  );
    
  }