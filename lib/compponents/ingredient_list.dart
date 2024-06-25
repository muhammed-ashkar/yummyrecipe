import 'package:flutter/material.dart';
import 'package:yummyrecipe/compponents/ingredient_item.dart';

class IngredientList extends StatelessWidget {
  final List<dynamic> ingredients;
  const IngredientList({super.key, required this.ingredients});

  @override
  Widget build(BuildContext context) {
    // Filter out invalid ingredients
    final validIngredients = ingredients.where((ingredient) {
      return ingredient['image'] != null && ingredient['image'].isNotEmpty;
    }).toList();

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: validIngredients.length,
      itemBuilder: (context, index) {
        int quantity = validIngredients[index]['quantity'].toInt() ?? 1;
        return IngredientItem(
          quantity: quantity.toString(),
          imageUrl: validIngredients[index]['image'] ?? '',
          measure: validIngredients[index]['measure'] ?? '',
          food: validIngredients[index]['food'] ?? '',
        );
      },
    );
  }
}
