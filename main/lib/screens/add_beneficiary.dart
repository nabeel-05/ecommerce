import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import this for input formatters

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Manrope', // Set the default font family
      ),
      home: AddBeneficiaryScreen(),
    );
  }
}

class AddBeneficiaryScreen extends StatefulWidget {
  @override
  _AddBeneficiaryScreenState createState() => _AddBeneficiaryScreenState();
}

class _AddBeneficiaryScreenState extends State<AddBeneficiaryScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();

  bool _nameHasFocus = false;
  bool _phoneHasFocus = false;
  bool _isSubmitted = false;

  @override
  void initState() {
    super.initState();

    // Add listeners to the focus nodes to detect when the field gains or loses focus
    _nameFocusNode.addListener(() {
      if (!_nameFocusNode.hasFocus) {
        setState(() {
          _nameHasFocus = true; // The field has lost focus, ready to validate
        });
      }
    });

    _phoneFocusNode.addListener(() {
      if (!_phoneFocusNode.hasFocus) {
        setState(() {
          _phoneHasFocus = true; // The field has lost focus, ready to validate
        });
      }
    });
  }

  @override
  void dispose() {
    // Dispose the controllers and focus nodes
    nameController.dispose();
    phoneController.dispose();
    _nameFocusNode.dispose();
    _phoneFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
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
          'Add Beneficiary',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true, // Center-aligns the title
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          autovalidateMode: _isSubmitted
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Name',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: nameController,
                focusNode: _nameFocusNode,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))
                ], // Only allow alphabetic input
                decoration: InputDecoration(
                  hintText: 'Enter the name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                ),
                validator: (value) {
                  if ((value == null || value.isEmpty) &&
                      (_nameHasFocus || _isSubmitted)) {
                    return 'Please enter a name';
                  } else if (RegExp(r'[0-9]').hasMatch(value!)) {
                    return 'Name should not contain numbers';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Text(
                'Add new Contact number',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    width: 80,
                    child: TextFormField(
                      initialValue: '+965',
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: phoneController,
                      focusNode: _phoneFocusNode,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ], // Only allow numeric input
                      decoration: InputDecoration(
                        hintText: '000000000', // Updated hint to 9 digits
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      ),
                      validator: (value) {
                        if ((value == null || value.isEmpty) &&
                            (_phoneHasFocus || _isSubmitted)) {
                          return 'Please enter a phone number';
                        } else if (!RegExp(r'^\d{9}$').hasMatch(value!)) {
                          return 'Please enter a valid 9-digit phone number';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isSubmitted = true;
                  });

                  // Validate the form
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar or navigate to the next screen
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
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
    );
  }
}
