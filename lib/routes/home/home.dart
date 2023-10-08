import 'package:diabeto/routes/home/pages/products/products.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 1;

  final List<Widget> destinations = [
    Placeholder(),
    Products(),
    Placeholder(),
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
