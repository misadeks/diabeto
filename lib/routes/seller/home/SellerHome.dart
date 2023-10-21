import 'package:diabeto/routes/seller/home/pages/products/products.dart';
import 'package:diabeto/routes/seller/home/pages/settings/sellerSettings.dart';
import 'package:flutter/material.dart';

class SellerHome extends StatefulWidget {
  const SellerHome({super.key});

  @override
  State<SellerHome> createState() => _SellerHomeState();
}

class _SellerHomeState extends State<SellerHome> {
  int selectedIndex = 1;

  final List<Widget> destinations = [
    Placeholder(),
    Products(),
    Placeholder(),
    Placeholder(),
    SellerSettings(),
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
              label: 'Statistics'
          ),
          NavigationDestination(
              icon: Icon(Icons.star_border),
              label: 'Products'
          ),
          NavigationDestination(
              icon: Icon(Icons.access_time),
              label: 'Offers'
          ),
          NavigationDestination(
              icon: Badge(
                // #TODO Dynamically change notification number
                  label: Text('3'),
                  child: Icon(Icons.sticky_note_2_outlined)
              ),
              label: 'Notifications'
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
