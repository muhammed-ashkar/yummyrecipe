import 'package:flutter/material.dart';
import 'package:yummyrecipe/screens/Home%20Page/homeScreen.dart';
import 'package:yummyrecipe/screens/Search%20Screen/search_screen.dart';
import 'package:yummyrecipe/screens/recipe_category.dart';
import 'package:yummyrecipe/screens/saved_screen.dart';
import 'package:yummyrecipe/screens/shopping_screen.dart';
import 'package:yummyrecipe/compponents/bottom_nav_bar.dart';
import 'package:yummyrecipe/screens/wish_list.dart';
import 'package:yummyrecipe/constants/category_list.dart'; // Import the category_list.dart file

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    RecipeCategory(categoryImages: categoryImages, categories: categories), // Pass the lists here
    const SearchScreen(),
    const SavedScreen(),
    const ShoppingScreen(),
    const WishlistScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavBar(
        selectedItem: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
