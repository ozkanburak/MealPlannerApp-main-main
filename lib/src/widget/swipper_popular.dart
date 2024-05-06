import 'package:flutter/material.dart';

import 'package:flutter_swiper_view/flutter_swiper_view.dart';


class swiperPopuler extends StatelessWidget {
  // kayan resim sadece 1 tane olması için kullanıyoruz
  final controller = PageController(
    initialPage: 1,
    viewportFraction: 0.9

  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Swiper(
        itemBuilder: (BuildContext context, int index){
          return PageView(
            controller: controller,
            children: <Widget>[
              _card(),
              _card1(),

            ],
          ); 
        },
        //üst üste resimler gelmesi için 
        itemCount: 2,
        layout: SwiperLayout.DEFAULT,
        ),
          
    );
  }
  //slider card
  Widget _card(){
    return Container(
      margin: EdgeInsets.only(left: 30.0,),
      alignment: AlignmentDirectional.centerEnd,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image(
          image: AssetImage('assets/fav1.jpg'),
          fit: BoxFit.fill,
          ),
      ),
    );
  }
  Widget _card1(){
    return Container(
      margin: EdgeInsets.only(left: 30.0,),
      alignment: AlignmentDirectional.centerEnd,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image(
          image: AssetImage('assets/recipe-slider1.png'),
          fit: BoxFit.fill,
          ),
      ),
    );
  }
}
