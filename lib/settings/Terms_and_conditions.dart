import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms and Conditions'),
        backgroundColor: Colors.orange,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Terms and Conditions',
                style: TextStyle(
                  fontSize: 24.0, // Increased font size for heading
                  fontWeight: FontWeight.bold, // Set the font to bold
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Last Updated: 24-06-2024\n\n'
                'Welcome to YummyRecipe! By using our application, you agree to comply with and be bound by the following terms and conditions ("Terms"). Please review these Terms carefully. If you do not agree with these Terms, you must not use our application.\n\n',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                '1. Acceptance of Terms\n\n',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold, // Set the font to bold
                ),
              ),
              Text(
                'By accessing and using YummyRecipe ("the App"), you agree to be bound by these Terms and Conditions, as well as our Privacy Policy, which is incorporated by reference. If you do not agree with any part of these Terms, you must discontinue use of the App immediately.\n\n',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                '2. Description of Service\n\n',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold, // Set the font to bold
                ),
              ),
              Text(
                'YummyRecipe is a recipe app that provides users with access to a variety of recipes and nutritional information sourced from the Edamam API. The App allows users to search, save, and share recipes, as well as create shopping lists.\n\n',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                '3. Use of Edamam API\n\n',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold, // Set the font to bold
                ),
              ),
              Text(
                'Our App integrates with the Edamam API to provide nutritional information and recipes. By using the App, you agree to comply with Edamam\'s Terms of Service and Privacy Policy, which can be found at [Edamam\'s Terms URL].\n\n',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                '4. User Conduct\n\n',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold, // Set the font to bold
                ),
              ),
              Text(
                'You agree to use the App only for lawful purposes and in accordance with these Terms. You agree not to:\n\n'
                '- Use the App in any manner that could disable, overburden, damage, or impair the App or interfere with any other party\'s use of the App.\n'
                '- Use any robot, spider, or other automatic device, process, or means to access the App for any purpose.\n'
                '- Use the App to distribute unsolicited promotional or commercial content, or solicit other users of the App for commercial purposes.\n'
                '- Violate any applicable local, state, national, or international law.\n\n',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                '5. Intellectual Property\n\n',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold, // Set the font to bold
                ),
              ),
              Text(
                'The App and its entire contents, features, and functionality (including but not limited to all information, software, text, displays, images, video, and audio) are owned by [Your Company Name], its licensors, or other providers of such material and are protected by international copyright, trademark, patent, trade secret, and other intellectual property or proprietary rights laws.\n\n',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                '6. Disclaimer of Warranties\n\n',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold, // Set the font to bold
                ),
              ),
              Text(
                'The App is provided on an "AS IS" and "AS AVAILABLE" basis. We do not warrant that the App will be uninterrupted, error-free, or free of viruses or other harmful components. To the fullest extent permitted by law, [Your Company Name] disclaims all warranties, express or implied, including any warranties of accuracy, reliability, and non-infringement.\n\n',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
