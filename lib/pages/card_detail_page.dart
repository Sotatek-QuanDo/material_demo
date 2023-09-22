import 'package:flutter/material.dart';

class CardDetailPage extends StatefulWidget {
  final String title;
  const CardDetailPage({super.key, required this.title});

  @override
  State<CardDetailPage> createState() => _CardDetailPageState();
}

class _CardDetailPageState extends State<CardDetailPage> {
  bool _isFavourited = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  _isFavourited = !_isFavourited;
                  ScaffoldMessenger.of(context).showSnackBar(
                    //Listener handle
                    SnackBar(
                      content: Text(_isFavourited == true
                          ? 'Added to list'
                          : 'Remove from list'),
                      action: SnackBarAction(
                        label: 'Action',
                        onPressed: () {
                          // Code to execute.
                        },
                      ),
                    ),
                  );
                });
              },
              icon: Icon(
                _isFavourited ? Icons.favorite_sharp : Icons.favorite_outline,
              )),
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
