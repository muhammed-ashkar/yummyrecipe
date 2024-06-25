import 'package:flutter/material.dart';
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
                      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red),
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
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
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
                    fontSize: w * 0.04, // Using the 'w' parameter passed from the parent widget
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
