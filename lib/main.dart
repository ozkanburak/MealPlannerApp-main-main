import 'package:admob_easy/ads/admob_easy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:recipce_app/src/styles/style.dart';
import 'package:recipce_app/src/pages/categorie.dart';
import 'package:recipce_app/src/pages/detail_page.dart';
import 'package:recipce_app/src/pages/home_page.dart';
import 'package:recipce_app/src/styles/style.dart';
import 'firebase_options.dart';

Future <void> main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColorLight: colorTitle
      ),
      debugShowCheckedModeBanner: false,
      routes:<String, WidgetBuilder> {
        '/' : (BuildContext context) => HomePage(),
        'categoria' : (BuildContext context) => CategoriPage(),
        'detail' : (BuildContext context) => DetailPage(),
      },
    );
  }
}