import 'package:flutter/material.dart';

class CardDetailPage extends StatefulWidget {
  final String title;
  const CardDetailPage({super.key, required this.title});

  @override
  State<CardDetailPage> createState() => _CardDetailPageState();
}

class _CardDetailPageState extends State<CardDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          const Icon(Icons.favorite_outline),
          MenuAnchor(
            alignmentOffset: const Offset(-40, -10),
            builder: (BuildContext context, MenuController controller,
                Widget? child) {
              return IconButton(
                onPressed: () {
                  if (controller.isOpen) {
                    controller.close();
                  } else {
                    controller.open();
                  }
                },
                icon: const Icon(Icons.more_horiz),
                tooltip: 'Show menu',
              );
            },
            menuChildren: List<MenuItemButton>.generate(
              3,
              (int index) => MenuItemButton(
                onPressed: () {},
                child: Text('Item ${index + 1}'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
