import 'package:flutter/material.dart';

void main() {
  runApp(AZeWalletApp());
}

class AZeWalletApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PrivacyStatementScreen(),
      theme: ThemeData(
        fontFamily: 'Manrope', // Set the default font family
      ),
    );
  }
}

class PrivacyStatementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white, // Keep background color white
            elevation: 0,
            pinned: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                'assets/logo.png', // Update the path with your actual logo path
                height: 38,
              ),
            ),
            // Remove flexibleSpace
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize
                      .min, // Ensure the column sizes to its content
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Privacy Statement',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3B2C63),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Privacy Statement for AZ eWallet',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'We’re thrilled to welcome you to AZ eWallet, your trusted digital wallet for seamless transactions and secure payments. Before you embark on your journey of effortless payments and exciting features, please take a moment to review and accept our Terms and Conditions, which lay down the ground rules for using our services. By proceeding with the registration, you acknowledge that you’ve read, understood, and agreed to the following Terms and Conditions.',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Data Privacy',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'We’re thrilled to welcome you to AZ eWallet, your trusted digital wallet for seamless transactions and secure payments. Before you embark on your journey of effortless payments and exciting features, please take a moment to review and accept our Terms and Conditions, which lay down the ground rules for using our services. By proceeding with the registration, you acknowledge that you’ve read, understood, and agreed to the following Terms and Conditions.',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(height: 16), // Add space at the bottom
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        backgroundColor: Color(0xFF3B2C63),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text('Continue'),
                    ),
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
