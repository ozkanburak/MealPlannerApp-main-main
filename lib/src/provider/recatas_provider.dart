import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart' show rootBundle;

class _RecetasProvider {
  List<dynamic> recetas = [];
  List<dynamic> categorias = [];
  List<dynamic> recetasCategoria = [];

  FirebaseFirestore firestore = FirebaseFirestore.instance;

//   Future <List<dynamic>> cargarRecetasPopulares() async {
//     final resp = await rootBundle.loadString('data/recetas.json');
//     Map<String,dynamic> recetasMap = json.decode(resp);
//     recatasPopulares = recetasMap['recatasPopulares'];
//     return recatasPopulares;
//   }
//   Future <List<dynamic>> cargarCategorias() async {
//     final resp = await rootBundle.loadString('data/recetas.json');
//     Map<String,dynamic> categoriasMap = json.decode(resp);
//     categorias = categoriasMap['categorias'];
//     return categorias;
//   }
//   Future <List<dynamic>> cargarCategoria(String nombreCategoria ) async {
//     final resp = await rootBundle.loadString('data/recetas.json');
//     Map<String,dynamic> categoriaMap = json.decode(resp);
//     recetasCategoria = categoriaMap[nombreCategoria];
//     return recetasCategoria;
//   }
Future<List<dynamic>> cargarRecetasPopulares() async {
    final List<dynamic> recetasTempList = [];
    await firestore
      .collection("recetas").get().then((QuerySnapshot querySnapshot) => {
            querySnapshot.docs.forEach((doc) {
              Map<String, dynamic> recetasMap =
                  doc.data() as Map<String, dynamic>;
              recetasTempList.add(recetasMap);
            })
          });
    recetas = recetasTempList;
    return recetas;
  }

  Future<List<dynamic>> cargarCategorias() async {
    final List<dynamic> categoriasTempList = [];
    await firestore
      .collection("categorias")
      .get()
      .then((QuerySnapshot querySnapshot) => {
            querySnapshot.docs.forEach((doc) {
              Map<String, dynamic> categoriasMap =
                  doc.data() as Map<String, dynamic>;
              categoriasTempList.add(categoriasMap);
            })
          });
    categorias = categoriasTempList;
    return categorias;
  }

  Future<List<dynamic>> cargarRecetaCategorias(String categoria) async {
    final List<dynamic> categoriaTempList = [];
    await firestore
      .collection(categoria).get().then((QuerySnapshot querySnapshot) => {
            querySnapshot.docs.forEach((doc) {
              Map<String, dynamic> categoriaMap =
                  doc.data() as Map<String, dynamic>;
              categoriaTempList.add(categoriaMap);
            })
          });
    recetasCategoria = categoriaTempList;
    return recetasCategoria;
  }
}
  

final recetasProvider = _RecetasProvider();
