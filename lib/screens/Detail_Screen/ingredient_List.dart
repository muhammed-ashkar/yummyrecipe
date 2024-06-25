import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yummyrecipe/compponents/custom_clip_path.dart';
import 'package:yummyrecipe/compponents/ingredient_list.dart';

class IngredientListSection extends StatelessWidget {
  final List<dynamic> ingredients;

  const IngredientListSection({Key? key, required this.ingredients}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          height: h * .07,
          width: w,
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: ClipPath(
                  clipper: CustomClipPath(),
                  child: Container(
                    color: Colors.redAccent,
                    child: Center(
                      child: Text(
                        'Ingredients Required',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: w * .05,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: Text('${ingredients.length}\nItems'),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: h * 1.8,
          child: IngredientList(
            ingredients: ingredients,
          ),
        ),
      ],
    );
  }
}
