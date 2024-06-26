import 'package:flutter/material.dart';
import 'package:yummyrecipe/compponents/custom_app_bar.dart';
import 'package:yummyrecipe/constants/constant_function.dart';
import 'package:yummyrecipe/screens/Detail_Screen/Detail_scree_explore.dart';
import 'package:yummyrecipe/screens/All_recipe/recipe_grid.dart';

class AllRecipeScreen extends StatelessWidget {
  final String recipe;

  const AllRecipeScreen({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(title: recipe, back: 'true'),
      body: FutureBuilder(
        future: constantFunction.getResponse(recipe),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data == null || !(snapshot.data is List)) {
            return Center(
              child: Text('Sorry no search results found'),
            );
          }

          final List<Map<String, dynamic>> recipes = snapshot.data as List<Map<String, dynamic>>;
          if (recipes.isEmpty) {
            return Center(
              child: Text('Sorry no search results found'),
            );
          }

          return Padding(
            padding: EdgeInsets.only(
              right: w * .034,
              left: w * .034,
              top: h * .03,
            ),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> snap = recipes[index];
                return RecipeGridItem(snap: snap, w: w);
              },
            ),
          );
        },
      ),
    );
  }
}
