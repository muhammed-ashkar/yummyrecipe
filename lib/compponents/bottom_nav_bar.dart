import 'package:flutter/material.dart';
import 'package:yummyrecipe/settings/main_settings.dart'; // Import SettingsPage

class BottomNavBar extends StatelessWidget {
  final int selectedItem;
  final ValueChanged<int> onTap;

  const BottomNavBar({
    Key? key,
    required this.selectedItem,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedItem < 6 ? selectedItem : 0, // Ensure the index is within range
      onTap: (index) {
        if (index == 6) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SettingsPage()),
          );
        } else {
          onTap(index); // Only set the index if it's within the valid range
        }
      },
      backgroundColor: Colors.white, // Change this to a color of your choice
      selectedItemColor: Colors.blue, // Change this to a color of your choice
      unselectedItemColor: Colors.grey, // Change this to a color of your choice
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          label: 'Categories',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark),
          label: 'Saved',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Shopping',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Wishlist',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}
