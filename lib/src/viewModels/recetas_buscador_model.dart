

import 'package:flutter/material.dart';
import 'package:recipce_app/src/styles/style.dart';

 List<Widget> recetasListadoBuscador(BuildContext context, List<dynamic> recetas, String recetaBuscada){
  final List<Widget> listadoRecetas = [];

  recetas.forEach((receta) {
      var titulo = receta['titulo'].toString().toLowerCase();
      if (titulo.contains(recetaBuscada)) {
        
        final listadoWidgetProvisional = _cuerpoRecetaListado(context, titleRecipeStyle, receta);
        listadoRecetas.add(listadoWidgetProvisional);

      };    
  });
  return listadoRecetas;


}

Widget _cuerpoRecetaListado(BuildContext context, estilos, Map<String,dynamic>receta){
  return Column(
    children: <Widget>[
       SizedBox(height: 10.0,
      ),
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'detail', arguments: receta);
          
        },
        child: Container(
        margin: EdgeInsets.only(left: 8.0,),
        child: ClipRRect(    
          borderRadius: BorderRadius.circular(8.0),
          child: Image(
            image: NetworkImage(receta['foto']),
            fit: BoxFit.fill,
            width: 350.0,
            height: 160.0,
            ),
        ),
      ),
      ),
      Container(
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
            maxLines: 3,
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
      )

    ],
  );
    
  }