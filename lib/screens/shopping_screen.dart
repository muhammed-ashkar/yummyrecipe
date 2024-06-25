import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yummyrecipe/constants/share.dart';
import 'package:yummyrecipe/hive%20operation/shopping_list.dart';
import 'package:yummyrecipe/screens/Home%20Page/home.dart';

class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    var shoppingBox = HiveOperations.getBox();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping'),
        backgroundColor: Colors.orange, // Set the background color to orange
        leading: IconButton(
          icon:const  Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home()));
          },
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: shoppingBox.listenable(),
        builder: (context, box, _) {
          var data = HiveOperations.getData();
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Container(
                  height: h * .085,
                  color: Colors.grey[100],
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          data[index],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      PopupMenuButton<String>(
                        itemBuilder: (context) {
                          return const [
                            PopupMenuItem(
                              value: 'share',
                              child: Text('Share'),
                            ),
                            PopupMenuItem(
                              value: 'delete',
                              child: Text('Delete'),
                            ),
                          ];
                        },
                        onSelected: (String value) async {
                          if (value == 'delete') {
                            await HiveOperations.deleteItem(index);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Item removed from shopping list')),
                            );
                          } else if (value == 'share') {
                            ShareRecipe.share(data[index]);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
