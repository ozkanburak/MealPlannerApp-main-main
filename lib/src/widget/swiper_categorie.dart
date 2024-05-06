import 'package:flutter/material.dart';

import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:recipce_app/src/provider/recatas_provider.dart';
import 'package:recipce_app/src/viewModels/categorias_listado.dart';

class SwiperCategorie extends StatelessWidget {

  final controller = PageController(
    initialPage: 1,
    viewportFraction: 0.3

  );

  @override
  Widget build(BuildContext context) {
   return Container(
    height: 110.0,
    child: Swiper(
      itemBuilder: (BuildContext context, int index){
        return  FutureBuilder(
            future: recetasProvider.cargarCategorias(), 
            initialData: [],
            builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){
              return PageView(
          controller: controller,
          children: categoriaListado(context)
        );
       }
     );       
   },
      itemCount: 3,
      layout: SwiperLayout.DEFAULT,
    ),
  );
  }
  
}
