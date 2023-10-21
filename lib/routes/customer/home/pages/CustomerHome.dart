import 'package:diabeto/routes/seller/home/pages/products/products.dart';
import 'package:flutter/material.dart';

class CustomerHome extends StatefulWidget {
  const CustomerHome({super.key});

  @override
  State<CustomerHome> createState() => _CustomerHomeState();
}

class _CustomerHomeState extends State<CustomerHome> {
  int selectedIndex = 1;

  final List<Widget> destinations = [
    Placeholder(),
    Products(),
    Placeholder(),
    Placeholder(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        selectedIndex: selectedIndex,
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.language),
              label: 'Home'
          ),
          NavigationDestination(
              icon: Icon(Icons.star_border),
              label: 'Following'
          ),
          NavigationDestination(
              icon: Icon(Icons.access_time),
              label: 'History'
          ),
          NavigationDestination(
              icon: Icon(Icons.settings),
              label: 'Settings'
          ),
        ],
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: destinations,
      ),
    );
  }
}
