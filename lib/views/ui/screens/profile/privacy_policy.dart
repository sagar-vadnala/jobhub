import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Privacy Policy',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Last update: 17/2/2023',
                style: TextStyle(color: Colors.grey[600]),
              ),
              SizedBox(height: 16),
              Text(
                'Please read these privacy policy, carefully before using our app operated by us.',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 24),
              Text(
                'Privacy Policy',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                style: TextStyle(height: 1.5),
              ),
              SizedBox(height: 16),
              Text(
                "If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.",
                style: TextStyle(height: 1.5),
              ),
              SizedBox(height: 16),
              Text(
                'All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.',
                style: TextStyle(height: 1.5),
              ),
              SizedBox(height: 16),
              Text(
                'The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.',
                style: TextStyle(height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
