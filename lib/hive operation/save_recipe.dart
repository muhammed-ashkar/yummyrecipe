import 'package:hive/hive.dart';

class SaveRecipeHive {
  static Future<void> saveRecipe(String key, Map<String, dynamic> recipe) async {
    var myBox = Hive.box('saved');
    await myBox.put(key, recipe);
  }

  static Future<void> deleteRecipe(String key) async {
    var myBox = Hive.box('saved');
    await myBox.delete(key);
  }

  static bool isRecipeSaved(String key) {
    var myBox = Hive.box('saved');
    return myBox.containsKey(key);
  }
}