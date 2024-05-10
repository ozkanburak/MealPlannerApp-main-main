import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:recipce_app/src/provider/ads_provider.dart';
import 'package:recipce_app/src/provider/recatas_provider.dart';
import 'package:recipce_app/src/styles/style.dart';
import 'package:recipce_app/src/viewModels/recipe_list.dart';
import 'package:recipce_app/src/widget/app_bar.dart';
import 'package:recipce_app/src/widget/menu_lateral.dart';
import 'package:recipce_app/src/widget/swiper_categorie.dart';
import 'package:recipce_app/src/widget/swipper_popular.dart';
import 'package:recipce_app/src/widget/titles.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AdsProvider()..loadBannerAd(),
      child: Scaffold(
        drawer: menuLateral(context),
        key: _scaffoldKey,
        backgroundColor: colorBG,
        body: CustomScrollView(
          slivers: <Widget>[
            appBar(context, _scaffoldKey),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    children: <Widget>[
                      swiperPopuler(),
                      titles('Category', titleStyle),
                      SwiperCategorie(),
                      titles('Favorite Recipes', titleStyle),
                      FutureBuilder(
                        future: recetasProvider.cargarRecetasPopulares(), 
                        initialData: [],
                        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){
                          return Column(
                            children: recetasListado(context, snapshot.data??[]),
                          );
                        }
                      ),
                      SizedBox(height: 10), // Araya boşluk ekleyebilirsiniz.
                      // Banner reklam alanı
                      Consumer<AdsProvider>(
                        builder: (context, adsProvider, child) {
                          if (adsProvider.bannerAd == null) {
                            // Reklam yüklenmemişse, yer tutucu bir widget dön
                            return Container(
                              height: 50, // Reklam yüklenene kadar sabit bir yükseklik
                              color: Colors.grey, // Yer tutucu rengi
                              alignment: Alignment.center,
                              child: Text(
                                'Banner Ad Placeholder',
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                          } else {
                            // Reklam yüklenmişse, reklamı dön
                            return Container(
                              height: adsProvider.bannerAd!.size.height.toDouble(),
                              width: adsProvider.bannerAd!.size.width.toDouble(),
                              child: AdWidget(ad: adsProvider.bannerAd!),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
