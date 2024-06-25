import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yummyrecipe/hive%20operation/save_recipe.dart';
import 'package:yummyrecipe/screens/Detail_Screen/Detail_scree_explore.dart';
import 'package:yummyrecipe/screens/Home%20Page/home.dart';


class SavedScreen extends StatelessWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    var myBox = Hive.box('saved');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved'),
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon:const  Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => const Home()));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          right: 8,
          left: 8,
        ),
        child: ValueListenableBuilder(
          valueListenable: myBox.listenable(),
          builder: (context, box, _) {
            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                var key = box.keyAt(index);
                return GestureDetector(
                  onTap: () {
                    // Navigate to DetailScreen when tapped
                    final recipe = myBox.get(key);
                    if (recipe != null && recipe is Map<String, dynamic>) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(item: recipe),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                       const  SnackBar(
                          content: Text('Error: Recipe data is null or not in the expected format'),
                        ),
                      );
                    }
                  },
                  child: ListTile(
                    title: Container(
                      height: h * .085,
                      color: Colors.grey[100],
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              key,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          PopupMenuButton<String>(
                            onSelected: (value) async {
                              if (value == 'delete') {
                                await SaveRecipeHive.deleteRecipe(key);
                              }
                            },
                            itemBuilder: (context) => [
                              const PopupMenuItem(
                                value: 'delete',
                                child: Text('Delete'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
