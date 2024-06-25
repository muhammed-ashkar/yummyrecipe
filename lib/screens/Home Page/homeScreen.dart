import 'package:flutter/material.dart';
import 'package:yummyrecipe/compponents/home_app_bar.dart';
import 'package:yummyrecipe/compponents/tab_bar_widget.dart';
import 'package:yummyrecipe/compponents/text_field_widget.dart';
import 'package:yummyrecipe/constants/images_path.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width; // width
    final h = MediaQuery.of(context).size.height; // height
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeAppBar(),
                SizedBox(height: h * 0.022),
                const TextFieldWidget(),
                SizedBox(height: h * 0.022),
                Container(
                  height: h * 0.50,
                  width: w - 30, // Set width to the full width of the parent minus padding
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImagesPath.explore),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                SizedBox(height: h * 0.023),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(fontSize: w * 0.045, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: h * 0.022),
                const TabBarWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
