import 'package:flutter/material.dart';
import 'package:yummyrecipe/screens/All_recipe/all_recipe.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return Container(
      height: h * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 1),
            blurRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: TextField(
              controller: searchController,
              style: TextStyle(
                fontSize: w * 0.04,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "What's cooking in your mind...?",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: w * 0.03,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AllRecipeScreen(recipe: searchController.text),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.search,
                    color: Colors.deepOrangeAccent,
                    size: w * 0.07,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
