import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yummyrecipe/hive%20operation/wish_list_hive.dart';
import 'package:yummyrecipe/screens/Detail_Screen/Detail_scree_explore.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RecipeGridItem extends StatelessWidget {
  final Map<String, dynamic> snap;
  final double w;

  const RecipeGridItem({Key? key, required this.snap, required this.w}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    int time = snap['totalTime'].toInt();
    var wishlistBox = Hive.box('wishlist');

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailScreen(item: snap)),
        );
      },
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  Container(
                    height: h * 0.25,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: snap['image'],
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error, color: Colors.red),
                    ),
                  ),
                  if (time > 0)
                    Positioned(
                      top: 7,
                      left: 15,
                      child: Container(
                        height: 20,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "$time min",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  Positioned(
                    top: 7,
                    right: 15,
                    child: ValueListenableBuilder(
                      valueListenable: wishlistBox.listenable(),
                      builder: (context, Box box, _) {
                        String key = snap['label'];
                        bool isInWishlist = WishlistHive.isRecipeInWishlist(key);
                        return GestureDetector(
                          onTap: () async {
                            if (isInWishlist) {
                              await WishlistHive.removeRecipeFromWishlist(key);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Removed from Wishlist')),
                              );
                            } else {
                              await WishlistHive.addRecipeToWishlist(key, snap);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  duration: Duration(seconds: 1),
                                  content: Text('Added to Wishlist'),
                                ),
                              );
                            }
                          },
                          child: CircleAvatar(
                            radius: w * 0.06,
                            backgroundColor: Colors.white,
                            child: Icon(
                              isInWishlist ? Icons.favorite : Icons.favorite_border,
                              color: Colors.red,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  left: 6,
                  right: 6,
                ),
                child: Text(
                  snap['label'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: w * 0.04,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
