import 'package:flutter/material.dart';
import 'package:yummyrecipe/compponents/recipe_category_view.dart';
import 'package:yummyrecipe/screens/Home%20Page/home.dart';

class RecipeCategory extends StatelessWidget {
  final List<String> categoryImages;
  final List<String> categories;

  const RecipeCategory({
    Key? key,
    required this.categoryImages,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    // Determine the maximum index to avoid range errors
    int maxIndexForRecommended = categoryImages.length >= 4 ? 4 : categoryImages.length;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Recipe Categories'),
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
            );
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * .04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: h * .02), // Adjusted spacing
            Text(
              'Recommended for You',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: w * .06),
            ),
            SizedBox(height: h * .01),
            _buildCategoryRow(
              context,
              categoryImages.sublist(0, maxIndexForRecommended),
              categories.sublist(0, maxIndexForRecommended),
            ),
            SizedBox(height: h * .02),
            Text(
              'Your Preferences',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: w * .055,
              ),
            ),
            _buildCategoryRow(
              context,
              categoryImages.sublist(
                4,
                categoryImages.length > 12 ? 12 : categoryImages.length,
              ),
              categories.sublist(
                4,
                categories.length > 12 ? 12 : categories.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryRow(BuildContext context, List<String> images, List<String> names) {
    final h = MediaQuery.of(context).size.height;

    // Ensure that both lists are of the same length to avoid range errors
    int length = images.length < names.length ? images.length : names.length;

    return SizedBox(
      height: h * .13,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(length, (index) {
            final String name = names[index];
            final String image = images[index];
            return RecipeCategoryView(name: name, image: image);
          }),
        ),
      ),
    );
  }
}
