import 'package:flutter/material.dart';
import 'package:yummyrecipe/compponents/bottom_nav_bar.dart';
import 'package:yummyrecipe/screens/Home%20Page/home.dart';
import 'package:yummyrecipe/screens/onboarding.dart'; // Import Home screen
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('shopping');
  await Hive.openBox('saved');
  await Hive.openBox('wishlist');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var box = Hive.box('shopping');
    
    // Check if onboarding should be shown (replace this with actual logic)
    bool showOnboarding = !box.get('onboardingCompleted', defaultValue: false);
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: showOnboarding
          ? const Scaffold(
              body: OnBoardingScreen(),
            )
          : MainScreen(), // Replace with your initial home screen
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(_selectedIndex),
      bottomNavigationBar: BottomNavBar(
        selectedItem: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return const Home(); // Your Home screen
      // Add cases for other screens if needed
      default:
        return Container(); // Placeholder
    }
  }
}
