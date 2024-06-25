import 'package:flutter/material.dart';
import 'package:yummyrecipe/screens/All_recipe/all_recipe.dart';
import 'package:yummyrecipe/screens/Home%20Page/home.dart';
import 'package:yummyrecipe/screens/Search%20Screen/search_result.dart';
import 'search_service.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _filteredSuggestions = [];
  final List<String> _categories = [
    'Chinese',
    'American',
    'Indian',
    'Pakistani',
    'Italian',
    'Mexican',
    'Japanese',
    'Thai',
  ];

  Future<void> _handleSearch(String query) async {
    try {
      if (query.isNotEmpty) {
        final results = await SearchService.fetchSuggestions(query);
        if (results.isEmpty) {
          SearchResultDialog.showNoResultsDialog(context);
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AllRecipeScreen(recipe: query),
            ),
          );
        }
      } else {
        setState(() {
          _filteredSuggestions = [];
        });
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $error'),
          duration: const Duration(seconds: 5),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => const Home()));
          },
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: h * 0.016,
            horizontal: w * 0.032,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        hintText: 'Search',
                      ),
                      onChanged: (text) async {
                        if (text.isEmpty) {
                          setState(() {
                            _filteredSuggestions = [];
                          });
                        } else {
                          final suggestions =
                              await SearchService.fetchSuggestions(text);
                          setState(() {
                            _filteredSuggestions = suggestions;
                          });
                        }
                      },
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () => _handleSearch(_searchController.text),
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.04,
              ),
              if (_filteredSuggestions.isEmpty) ...[
                Text(
                  'Categories',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: w * 0.06,
                  ),
                ),
                SizedBox(height: h * 0.02),
                Expanded(
                  child: SingleChildScrollView(
                    child: Wrap(
                      spacing: 8.0,
                      runSpacing: 4.0,
                      children: _categories.map((label) {
                        return ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    AllRecipeScreen(recipe: label),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          child: Text(label),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
              if (_filteredSuggestions.isNotEmpty)
                Expanded(
                  child: GestureDetector(
                    onPanDown: (_) => FocusScope.of(context).unfocus(),
                    child: ListView.builder(
                      itemCount: _filteredSuggestions.length,
                      itemBuilder: (context, index) {
                        final suggestion = _filteredSuggestions[index];
                        return ListTile(
                          title: Text(
                            suggestion['label'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    AllRecipeScreen(recipe: suggestion['label']),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
