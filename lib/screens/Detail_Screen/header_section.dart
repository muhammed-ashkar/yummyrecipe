import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HeaderSection extends StatelessWidget {
  final Map<String, dynamic> item;

  const HeaderSection({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
          height: h * .44,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(item['image']),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: h * .04,
          left: w * .05,
          child: CircleAvatar(
            backgroundColor: Colors.redAccent,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context); // This ensures it navigates back to the previous screen
              },
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
