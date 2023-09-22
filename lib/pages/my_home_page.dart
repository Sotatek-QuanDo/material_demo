import 'package:flutter/material.dart';
import 'package:material_demo/lib.dart';
import 'package:material_demo/pages/carousel_page.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({super.key});

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
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
              child: const Icon(Icons.card_giftcard),
            ),
            label: 'Card',
          ),
          const NavigationDestination(
            icon: Badge(
              child: Icon(Icons.card_travel_outlined),
            ),
            label: 'List Cards',
          ),
          NavigationDestination(
            icon:
                Badge.count(count: 10000, child: const Icon(Icons.select_all)),
            label: 'Select ',
          ),
          NavigationDestination(
            icon:
                Badge.count(count: 99, child: const Icon(Icons.view_carousel)),
            label: 'Carousel ',
          ),
        ],
      ),
      body: <Widget>[
        const CardPage(),
        const ListCardPage(),
        const SelectOptionsPage(),
        const CarouselPage(),
      ][currentPageIndex],
    );
  }
}
