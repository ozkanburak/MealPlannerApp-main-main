
import 'package:flutter/material.dart';

List<Widget> ingredientesListado (List<dynamic> ingredientes){

  final List<Widget> listadoIngredientes = [];
  final List<dynamic> ingredienteListado = ingredientes;

  ingredienteListado.forEach((ingrediente) {
    final Widget widgetProv = _imagen(ingrediente);
    listadoIngredientes.add(widgetProv);
   });
   
   return listadoIngredientes;


}

Widget _imagen(Map<String,dynamic> ingrediente){
  return Center(
    child: Stack(
      children: [
        Container(
          width: 130.0,
          height: 100.0,
          margin: EdgeInsets.only(right: 10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image(
              image: NetworkImage(ingrediente['fotoIngrediente']),
              fit: BoxFit.cover,
          ),
        ),),
        Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.all(20.0),
          child: Text(ingrediente['ingrediente'],
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                blurRadius: 10.0,
                color: Colors.black,
                offset: Offset(5.0, 5.0)
              )
            ]
          ),),
        )
      ],
    
    ),
    
  );

}