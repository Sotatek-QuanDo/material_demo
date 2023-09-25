import 'package:flutter/material.dart';

class SheetPage extends StatefulWidget {
  const SheetPage({super.key});

  @override
  State<SheetPage> createState() => _SheetPageState();
}

class _SheetPageState extends State<SheetPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (ctx) {
                    return Container();
                  });
            },
            child: const Text(
              'Show Modal Bottom',
            ),
          ),
          TextButton(
            onPressed: () {
              showBottomSheet(
                  context: context,
                  builder: (ctx) {
                    return Container();
                  });
            },
            child: const Text(
              'Show Bottom',
            ),
          )
        ],
      ),
    );
  }
}
