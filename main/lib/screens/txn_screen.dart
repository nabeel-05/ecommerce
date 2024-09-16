import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Manrope',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const TransactionHistoryScreen(),
    );
  }
}

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor:
                  Colors.white, // Set the background color to white
              elevation: 0, // Remove shadow
              pinned: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
              title: const Text(
                'History',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: Image.asset('assets/Vector.png',
                      color: const Color(0xFF3B2C63)),
                  onPressed: () {},
                ),
              ],
              flexibleSpace: Container(
                color: Colors
                    .white, // Ensure that the flexible space is also white
              ),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Search Bar and Filter Icons
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search for payment',
                        prefixIcon: Image.asset('assets/Search.png',
                            color: const Color(0xFF3B2C63)),
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    icon: Image.asset('assets/Slider.png',
                        color: const Color(0xFF3B2C63)),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 18),

              // Filter Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FilterButton(label: '30 Days', isSelected: true),
                  FilterButton(label: '60 Days', isSelected: false),
                  FilterButton(label: '90 Days', isSelected: false),
                ],
              ),
              const SizedBox(height: 16),

              // Transaction List
              Expanded(
                child: ListView(
                  children: [
                    TransactionTile(
                      icon: Image.asset('assets/qrcode.png'),
                      title: 'Lorem',
                      subtitle: 'QR Payment',
                      amount: '-Rs 75.000',
                      date: '5 Jul 2023',
                      isPositive: false,
                      status: 'Success',
                    ),
                    TransactionTile(
                      icon: Image.asset('assets/send2.png'),
                      title: 'Lorem',
                      subtitle: 'Bank Transfer',
                      amount: '-Rs 115.000',
                      date: '5 Jul 2023',
                      isPositive: false,
                      status: 'Success',
                    ),
                    TransactionTile(
                      icon: Image.asset('assets/send1.png'),
                      title: 'Lorem',
                      subtitle: 'Top Up',
                      amount: '+Rs 345.000',
                      date: '5 Jul 2023',
                      isPositive: true,
                      status: 'Success',
                    ),
                    TransactionTile(
                      icon: Image.asset('assets/wallet.png'),
                      title: 'Lorem',
                      subtitle: 'Sent to Friend',
                      amount: '-Rs 115.000',
                      date: '5 Jul 2023',
                      isPositive: false,
                      status: 'Success',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SizedBox(
              child: Image.asset('assets/home.png'),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              child: Image.asset('assets/scanAndPay.png'),
            ),
            label: 'Scan & Pay',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              child: Image.asset('assets/profile.png'),
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              child: Image.asset('assets/chart.png'),
            ),
            label: 'Transaction',
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(
          fontSize: 14,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String label;
  final bool isSelected;

  const FilterButton({
    Key? key,
    required this.label,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[200],
        foregroundColor: const Color(0xFF3B2C63),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class TransactionTile extends StatelessWidget {
  final Image icon;
  final String title;
  final String subtitle;
  final String amount;
  final String date;
  final bool isPositive;
  final String status;

  const TransactionTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.date,
    required this.isPositive,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey[200],
          child: icon,
        ),
        title: Text(title),
        subtitle: Text('$subtitle\n$date'),
        isThreeLine: true,
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              amount,
              style: TextStyle(
                color: isPositive ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              status,
              style: const TextStyle(color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
