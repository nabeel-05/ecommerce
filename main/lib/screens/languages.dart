import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Manrope', // Set the default font for the app
      ),
      home: LanguageSelectionScreen(),
    );
  }
}

class LanguageSelectionScreen extends StatefulWidget {
  @override
  _LanguageSelectionScreenState createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  // Variable to track the selected language
  String selectedLanguage = 'EN'; // Default to English

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set full background to white
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back when pressed
          },
        ),
        title: Text(
          'Select a Language',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true, // Center-aligns the title
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Container(
              width: double.infinity, // Ensures the Row takes full width
              padding: EdgeInsets.symmetric(
                  horizontal: 20.0), // Optional: adds padding
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.start, // Aligns children to the left
                children: [
                  SizedBox(
                    width: 80, // Set fixed width for the buttons
                    height: 85,
                    child: LanguageButton(
                      languageCode: 'EN',
                      languageName: 'English',
                      isSelected: selectedLanguage == 'EN',
                      onPressed: () {
                        setState(() {
                          selectedLanguage = 'EN';
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  SizedBox(
                    width: 80, // Set fixed width for the buttons
                    height: 85,
                    child: LanguageButton(
                      languageCode: 'AR',
                      languageName: 'Arabic',
                      isSelected: selectedLanguage == 'AR',
                      onPressed: () {
                        setState(() {
                          selectedLanguage = 'AR';
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageButton extends StatelessWidget {
  final String languageCode;
  final String languageName;
  final bool isSelected;
  final VoidCallback onPressed;

  LanguageButton({
    required this.languageCode,
    required this.languageName,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Color(0xFF3B2C63) : Colors.grey[300],
        foregroundColor: isSelected ? Colors.white : Colors.black,
        padding: EdgeInsets.symmetric(vertical: 20.0), // Padding for height
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            languageCode,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Manrope', // Use Manrope font
            ),
          ),
          Text(
            languageName,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Manrope', // Use Manrope font
            ),
          ),
        ],
      ),
    );
  }
}
