import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        backgroundColor: Colors.orange,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            'Privacy Policy\n\n'
            'Your privacy is important to us.\n\n'
            'It is Food Fusion’s policy to respect your privacy regarding any information we may collect while operating our website. Accordingly, we have developed this privacy policy in order for you to understand how we collect, use, communicate, disclose and otherwise make use of personal information. We have outlined our privacy policy below.\n\n'
            'We will collect personal information by lawful and fair means and, where appropriate, with the knowledge or consent of the individual concerned.\n\n'
            'Before or at the time of collecting personal information, we will identify the purposes for which information is being collected.\n\n'
            'We will collect and use personal information solely for fulfilling those purposes specified by us and for other ancillary purposes, unless we obtain the consent of the individual concerned or as required by law.\n\n'
            'Personal data should be relevant to the purposes for which it is to be used, and, to the extent necessary for those purposes, should be accurate, complete, and up-to-date.\n\n'
            'We will protect personal information by using reasonable security safeguards against loss or theft, as well as unauthorized access, disclosure, copying, use or modification.\n\n'
            'We will make readily available to customers information about our policies and practices relating to the management of personal information.\n\n'
            'We will only retain personal information for as long as necessary for the fulfilment of those purposes.\n\n'
            'We are committed to conducting our business in accordance with these principles in order to ensure that the confidentiality of personal information is protected and maintained. Food Fusion may change this privacy policy from time to time at Food Fusion’s sole discretion.\n\n',
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}
