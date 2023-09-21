import 'package:flutter/material.dart';
import 'package:material_demo/lib.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        destinations: [
          NavigationDestination(
            icon: Badge.count(
              count: 1,
              smallSize: 0,
              child: const Icon(Icons.card_giftcard),
            ),
            label: 'Card',
          ),
          const NavigationDestination(
            icon: Badge(
              child: Icon(Icons.view_carousel),
            ),
            label: 'List Cards',
          ),
          NavigationDestination(
            icon:
                Badge.count(count: 10000, child: const Icon(Icons.select_all)),
            label: 'Select ',
          ),
        ],
      ),
      body: <Widget>[
        const CardPage(),
        const ListCardPage(),
        const SelectOptionsPage(),
      ][currentPageIndex],
    );
  }
}
