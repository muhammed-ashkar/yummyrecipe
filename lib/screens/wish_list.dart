import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yummyrecipe/screens/Detail_Screen/Detail_scree_explore.dart';
import 'package:yummyrecipe/screens/Home%20Page/home.dart';
import 'package:cached_network_image/cached_network_image.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var wishlistBox = Hive.box('wishlist');
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Wishlist"),
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home()));
          },
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: wishlistBox.listenable(),
        builder: (context, Box box, _) {
          if (box.isEmpty) {
            return const Center(child: Text('No recipes in wishlist'));
          }

          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final key = box.keyAt(index);
              final item = box.get(key);

              return Card(
                margin: EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.01),
                child: ListTile(
                  contentPadding: EdgeInsets.all(w * 0.04),
                  title: Text(item['label'], style: TextStyle(fontSize: w * 0.05, fontWeight: FontWeight.bold)),
                  subtitle: Text('Time: ${item['totalTime']} min'),
                  leading: CachedNetworkImage(
                    imageUrl: item['image'],
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                    width: w * 0.2,
                    fit: BoxFit.cover,
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      box.delete(key);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Removed from Wishlist')),
                      );
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailScreen(item: Map<String, dynamic>.from(item))),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
