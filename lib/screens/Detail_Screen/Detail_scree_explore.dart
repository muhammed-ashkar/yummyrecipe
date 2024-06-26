import 'package:flutter/material.dart';
import 'package:yummyrecipe/constants/start_cooking.dart';
import 'package:yummyrecipe/screens/Detail_Screen/buttons_row.dart';
import 'package:yummyrecipe/screens/Detail_Screen/header_section.dart';
import 'package:yummyrecipe/screens/Detail_Screen/ingredient_List.dart';
import 'package:yummyrecipe/screens/wish_list.dart';


class DetailScreen extends StatefulWidget {
  final Map<String, dynamic> item;

  const DetailScreen({Key? key, required this.item}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();

  // Navigation method
  static void navigateToSaved(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const WishlistScreen()),
    );
  }
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    String time = widget.item['totalTime'].toString();

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderSection(item: widget.item),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: w * .04),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      widget.item['label'],
                      style: TextStyle(
                        fontSize: w * .05,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 1),
                    Text('$time min'),
                    SizedBox(height: h * .01),
                    ButtonsRow(item: widget.item),
                    SizedBox(height: h * .02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Direction',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: w * .06,
                          ),
                        ),
                        SizedBox(
                          width: w * .34,
                          child: ElevatedButton(
                            onPressed: () {
                              StartCooking.startCooking(widget.item['url']);
                            },
                            child: const Text('Start'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: h * .02),
                    IngredientListSection(ingredients: widget.item['ingredients']),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
