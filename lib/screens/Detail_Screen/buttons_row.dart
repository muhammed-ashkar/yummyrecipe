import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yummyrecipe/compponents/circle_button.dart';
import 'package:yummyrecipe/hive%20operation/save_recipe.dart';
import 'package:yummyrecipe/hive%20operation/wish_list_hive.dart';
import 'package:yummyrecipe/constants/share.dart';
import 'package:yummyrecipe/constants/show_detail_dialog.dart';
import 'package:yummyrecipe/constants/show_table.dart';

class ButtonsRow extends StatelessWidget {
  final Map<String, dynamic> item;

  const ButtonsRow({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myBox = Hive.box('saved');
    var wishlistBox = Hive.box('wishlist');

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            ShareRecipe.share(item['url']);
          },
          child: const CircleButton(
            icon: Icons.share,
            label: 'share',
          ),
        ),
        ValueListenableBuilder(
          valueListenable: myBox.listenable(),
          builder: (context, box, _) {
            String key = item['label'];
            bool saved = SaveRecipeHive.isRecipeSaved(key);
            if (saved) {
              return GestureDetector(
                onTap: () async {
                  await SaveRecipeHive.deleteRecipe(key);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Recipe deleted')),
                  );
                },
                child: const CircleButton(
                  icon: Icons.bookmark,
                  label: 'Saved',
                ),
              );
            } else {
              return GestureDetector(
                onTap: () async {
                  await SaveRecipeHive.saveRecipe(key, item);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(seconds: 1),
                      content: Text('Recipe Saved Successfully'),
                    ),
                  );
                },
                child: const CircleButton(
                  icon: Icons.bookmark_border,
                  label: 'Save',
                ),
              );
            }
          },
        ),
        ValueListenableBuilder(
          valueListenable: wishlistBox.listenable(),
          builder: (context, box, _) {
            String key = item['label'];
            bool isInWishlist = WishlistHive.isRecipeInWishlist(key);
            if (isInWishlist) {
              return GestureDetector(
                onTap: () async {
                  await WishlistHive.removeRecipeFromWishlist(key);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Removed from Wishlist')),
                  );
                },
                child: const CircleButton(
                  icon: Icons.favorite,
                  label: 'Wishlisted',
                ),
              );
            } else {
              return GestureDetector(
                onTap: () async {
                  await WishlistHive.addRecipeToWishlist(key, item);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(seconds: 1),
                      content: Text('Added to Wishlist'),
                    ),
                  );
                },
                child: const CircleButton(
                  icon: Icons.favorite_border,
                  label: 'Wishlist',
                ),
              );
            }
          },
        ),
        GestureDetector(
          onTap: () {
            ShowDialog.showCalories(item['totalNutrients'], context);
          },
          child: const CircleButton(
            icon: Icons.monitor_heart_outlined,
            label: 'Calories',
          ),
        ),
        GestureDetector(
          onTap: () {
            ShowTable.showTable(context);
          },
          child: const CircleButton(
            icon: Icons.table_chart_outlined,
            label: 'unit chart',
          ),
        ),
      ],
    );
  }
}
