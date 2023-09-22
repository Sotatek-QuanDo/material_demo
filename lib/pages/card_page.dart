import 'package:flutter/material.dart';
import 'package:material_demo/lib.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(child: buildCardWidgets()),
          const Expanded(
            child: Center(
              child: Text(
                  'Badges show notifications, counts, or status information on navigation items and icons',
                  style: TextStyle(fontWeight: FontWeight.w500)),
            ),
          ),
          const Text(
            'Some new IconButton',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          Expanded(child: buildIconButtonWidgets()),
        ],
      ),
    );
  }

  Widget buildCardWidgets() {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 0.0,
        mainAxisSpacing: 5,
        mainAxisExtent: 100,
      ),
      children: const [
        Card(
          elevation: 4,
          child: SizedBox(
            child: Center(child: Text('Elevated Card')),
          ),
        ),
        Card(
          color: Colors.green,
          child: SizedBox(
            height: 100,
            child: Center(child: Text('Filled Card')),
          ),
        ),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.green,
            ),
          ),
          child: SizedBox(
            height: 100,
            child: Center(child: Text('Outline Card')),
          ),
        ),
      ],
    );
  }

  Widget buildIconButtonWidgets() {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 1,
        crossAxisSpacing: 0.0,
        mainAxisSpacing: 5,
        mainAxisExtent: 100,
      ),
      children: [
        IconButton.filled(
          onPressed: () {},
          icon: const Icon(Icons.settings),
        ),
        IconButton.filledTonal(
          onPressed: () {},
          icon: const Icon(Icons.settings),
        ),
        IconButton.outlined(
          onPressed: () {},
          icon: const Icon(Icons.settings),
        ),
      ],
    );
  }
}
