import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:recipce_app/src/viewModels/ingredientes_listado.dart';

final controller = PageController(
  initialPage: 1,
  viewportFraction: 0.3
);

Widget SliderIngrediente(List<dynamic> ingredientes){
  return Container(
    height: 120.0,
    padding: EdgeInsets.only(left: 5.0),
    child: Swiper(
      itemCount: 1,
      layout: SwiperLayout.DEFAULT,
      itemBuilder: (BuildContext context, int index){
        return PageView(
          controller: controller,
          children: ingredientesListado(ingredientes),
          

        );

      },
      
    ),
  );
}

