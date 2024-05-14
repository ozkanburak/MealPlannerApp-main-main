import 'package:flutter/material.dart';
import 'package:recipce_app/src/provider/recatas_provider.dart';
import 'package:recipce_app/src/viewModels/categorie_drawer.dart';

class CategorieListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 650.0, // Toplam yükseklik, ihtiyaca göre ayarlanabilir.
      child: FutureBuilder(
        future: recetasProvider.cargarCategorias(),
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length, // Veri sayısına göre eleman sayısı
              itemBuilder: (BuildContext context, int index) {
                return categoriaListadoDrawer(context)[index]; // Her bir kategori widget'ı
              },
            );
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else {
            return Center(child: CircularProgressIndicator()); // Yükleme döngüsü
          }
        },
      ),
    );
  }
}