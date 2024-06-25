import 'dart:convert';
import 'package:http/http.dart' as http;

class SearchService {
  static Future<List<Map<String, dynamic>>> fetchSuggestions(
      String query) async {
    final url =
        'https://api.edamam.com/search?q=$query&app_id=b3907eee&app_key=68fd63fdd3380b4501b96cc72e5afeeb&from=0&to=20&calories=591-722&health=alcohol-free';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List recipes = data['hits'];
        return recipes.map<Map<String, dynamic>>((recipe) {
          final recipeData = recipe['recipe'];
          return {
            'label': recipeData['label'],
            'image': recipeData['image'],
            'totalTime': recipeData['totalTime'],
          };
        }).toList();
      } else {
        throw Exception('Failed to load suggestions');
      }
    } catch (e) {
      throw Exception('Failed to load suggestions: $e');
    }
  }
}
