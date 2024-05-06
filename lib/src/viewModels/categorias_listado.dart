

import 'package:flutter/material.dart';
import 'package:recipce_app/src/provider/recatas_provider.dart';

List<Widget> categoriaListado (BuildContext context){
  final List<Widget> listadoCategoria = [];
  final List<dynamic> categorias = recetasProvider.categorias;

  categorias.forEach((categoria) {
    final Widget widgetProv = _imageCategori(context, categoria);
    listadoCategoria.add(widgetProv);
   });
   return listadoCategoria;


}
Widget _imageCategori(BuildContext context, Map<String, dynamic> categoria){
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'categoria', arguments: categoria);
        
      },
      child: Stack(
        children: [
          Container(
            width: 130.0,
            height: 100.0,
            margin: EdgeInsets.only(left: 10.0,right: 10.0, top: 10.0),
            child: ClipRRect(    
              borderRadius: BorderRadius.circular(10.0),
              child: Image(
                image: NetworkImage(categoria['foto']),
                fit: BoxFit.cover,
                
            ),
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(20.0),
        child: Text(categoria['nombre'],
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                decorationColor: Colors.black,
                decorationStyle: TextDecorationStyle.wavy,
                fontSize: 13
              )),
      )
   ],
  )   
 ); 
}