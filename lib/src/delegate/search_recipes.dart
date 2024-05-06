import 'package:flutter/material.dart';
import 'package:recipce_app/src/provider/recatas_provider.dart';
import 'package:recipce_app/src/styles/style.dart';
import 'package:recipce_app/src/viewModels/recetas_buscador_model.dart';

class RecetasSearchDelegate extends SearchDelegate{

  @override
  ThemeData appBarTheme(BuildContext context){
    final ThemeData theme = Theme.of(context);

    return theme.copyWith(
      primaryColor:  theme.primaryColorLight,
      primaryIconTheme: theme.primaryIconTheme,
      brightness: Brightness.dark,
      primaryTextTheme: theme.primaryTextTheme,
      textTheme: theme.textTheme.copyWith(
          titleLarge: theme.textTheme.titleLarge!.copyWith(
            color: Colors.black,
          ),
        ),
      inputDecorationTheme: theme.inputDecorationTheme.copyWith(
        hintStyle: TextStyle(
          color: Colors.green
        ),
      )
      

    );

  }



  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton( 
      icon: Icon(Icons.clear),
      onPressed: (){
        this.query = '';
      }
      ),

    ];

  }

  @override
  Widget? buildLeading(BuildContext context) {
   return IconButton( 
    icon: Icon(Icons.arrow_back_ios),
    onPressed: (){
      this.close(context, null);
    }
    );
    
  }

  @override
  Widget buildResults(BuildContext context) {
     return FutureBuilder(
      future: recetasProvider.cargarRecetasPopulares(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){
        List<dynamic>? recetas = snapshot.data;
        var recetaBuscada = this.query.toLowerCase();
        return CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    children: recetasListadoBuscador(context, recetas!, recetaBuscada),
                  )
                ]
              ),
              )
          ],
        );
      },
      );
      
  }

  @override
  Widget buildSuggestions(BuildContext context) {
     return Container(
      padding: EdgeInsets.all(10.0),
      child: Text(
        'Favori',
        style: titleRecipeDetail,
      ),
     );
      
  }

}