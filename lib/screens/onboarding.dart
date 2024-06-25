import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yummyrecipe/constants/images_path.dart';
import 'package:yummyrecipe/screens/Home%20Page/home.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox(
        height: h,
        width: w,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                height: h * 0.79,
                width: w,
                decoration:const  BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImagesPath.onBoardingTitle),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Center(
              child: Image.asset(ImagesPath.onBoardingTitle),
            ),
            Positioned(
  bottom: 0,
  child: Container(
    height: h * 0.243,
    width: w,
    decoration:const  BoxDecoration(
      color: Colors.red,
      borderRadius:  BorderRadius.only(
        topRight: Radius.circular(40),
        topLeft: Radius.circular(40),
      ),
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Let's cook good food",
            style: TextStyle(
              fontSize: w * 0.06,
              fontWeight: FontWeight.w600,
              color: Colors.white, // Changed text color to white
            ),
          ),
          SizedBox(height: h * 0.01),
          const Text(
            'Check out the app and start cooking delicious meals!',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Colors.white, // Changed text color to white
            ),
          ),
          SizedBox(height: h * .032),
          SizedBox(
            width: w * .8,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const Home(),), (route) => false,);
              },
              child: const Text(
                'Get Started',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  ),
),
 
          ],
        ),
      ),
    );
  }
}
