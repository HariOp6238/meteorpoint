import 'package:flutter/material.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.black,
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Terms and Conditions',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Please read these terms and conditions carefully before using the MeteorPoint app.',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Text('1. Acceptance of Terms',
                  style: TextStyle(color: Colors.white)),
              SizedBox(
                height: 10,
              ),
              Text(
                  'By using the MeteorPoint app, you agree to comply with and be bound by the following terms and conditions. If you do not agree to these terms, please do not use the app.',
                  style: TextStyle(color: Colors.white)),
              SizedBox(
                height: 10,
              ),
              Text('2. Use of the App', style: TextStyle(color: Colors.white)),
              SizedBox(
                height: 10,
              ),
              Text(
                  'You may use MeteorPoint for personal, non-commercial purposes.',
                  style: TextStyle(color: Colors.white)),
              SizedBox(
                height: 10,
              ),
              Text(
                  ' You are not permitted to download, copy, or distribute the apps content, including text, images, or any other media, without explicit written consent.',
                  style: TextStyle(color: Colors.white)),
              SizedBox(
                height: 10,
              ),
              Text('3. Sharing', style: TextStyle(color: Colors.white)),
              SizedBox(
                height: 10,
              ),
              Text(
                  'Do not misuse the sharing features for any unlawful, harmful, or inappropriate purposes.',
                  style: TextStyle(color: Colors.white)),
              SizedBox(
                height: 10,
              ),
              Text('4. Copyright and Intellectual Property',
                  style: TextStyle(color: Colors.white)),
              SizedBox(
                height: 10,
              ),
              Text(
                  'All content within MeteorPoint is protected by copyright and other intellectual property rights',
                  style: TextStyle(color: Colors.white)),
              SizedBox(
                height: 10,
              ),
              Text(
                  'You may not use, reproduce, or distribute any content from MeteorPoint without permission.',
                  style: TextStyle(color: Colors.white)),
              SizedBox(
                height: 10,
              ),
              Text('5. User-Generated Content',
                  style: TextStyle(color: Colors.white)),
              SizedBox(
                height: 10,
              ),
              Text(
                  'You may be able to submit user-generated content, such as comments or feedback. By submitting content, you grant MeteorPoint the right to use, modify, and display the content.',
                  style: TextStyle(color: Colors.white)),
              SizedBox(
                height: 10,
              ),
              Text('6. Privacy', style: TextStyle(color: Colors.white)),
              SizedBox(
                height: 10,
              ),
              Text(
                  'MeteorPoint collects and processes personal data as described in our Privacy Policy. By using the app, you consent to our data practices as described in the Privacy Policy.',
                  style: TextStyle(color: Colors.white)),
              SizedBox(
                height: 10,
              ),
              Text('7. Disclaimers', style: TextStyle(color: Colors.white)),
              SizedBox(
                height: 10,
              ),
              Text(
                  'MeteorPoint provides data and information for general purposes. We do not guarantee the accuracy or completeness of the content.',
                  style: TextStyle(color: Colors.white)),
              SizedBox(
                height: 10,
              ),
              Text(
                  'We are not responsible for any third-party websites, services, or content that may be linked or referenced in the app.',
                  style: TextStyle(color: Colors.white)),
              SizedBox(
                height: 10,
              ),
              Text('8. Changes to Terms',
                  style: TextStyle(color: Colors.white)),
              SizedBox(
                height: 10,
              ),
              Text(
                  'MeteorPoint may modify these terms and conditions at any time. It is your responsibility to review them periodically for updates.',
                  style: TextStyle(color: Colors.white)),
              SizedBox(
                height: 10,
              ),
              Text(
                  'By using the MeteorPoint app, you acknowledge that you have read, understood, and agreed to these terms and conditions. If you do not agree with these terms, please do not use the app.',
                  style: TextStyle(color: Colors.white)),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
