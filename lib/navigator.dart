import 'package:flutter/material.dart';
import 'package:material_demo/lib.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (value) {
          setState(() {
            currentPageIndex = value;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.radio_button_checked),
            label: 'Buttons',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('1'),
              child: Icon(Icons.group),
            ),
            label: 'Card',
          ),
          NavigationDestination(
            icon: Badge(
              child: Icon(
                Icons.view_carousel,
              ),
            ),
            label: 'Carousel',
          ),
          NavigationDestination(
            icon: Icon(Icons.local_activity),
            label: 'Option',
          ),
          NavigationDestination(
            icon: Icon(Icons.other_houses),
            label: 'Others',
          ),
        ],
      ),
      body: <Widget>[
        const ButtonPage(),
        const CardPage(),
        const CarouselPage(),
        const SelectOptionsPage(),
        const OtherPage(),
      ][currentPageIndex],
    );
  }
}
