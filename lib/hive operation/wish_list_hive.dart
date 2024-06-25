import 'package:hive/hive.dart';

class WishlistHive {
  static Box getWishlistBox() {
    return Hive.box('wishlist');
  }

  static bool isRecipeInWishlist(String key) {
    return getWishlistBox().containsKey(key);
  }

  static Future<void> addRecipeToWishlist(String key, Map<String, dynamic> recipe) async {
    await getWishlistBox().put(key, recipe);
  }

  static Future<void> removeRecipeFromWishlist(String key) async {
    await getWishlistBox().delete(key);
  }
}
