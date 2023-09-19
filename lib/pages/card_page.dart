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
      child: Scaffold(
        body: Column(
          children: [
            const Card(
              elevation: 4,
              shadowColor: Colors.pink,
              child: SizedBox(
                height: 100,
                width: double.infinity,
                child: Center(child: Text('Elevated Card')),
              ),
            ),
            horizontalDivider,
            const Card(
              color: Colors.pink,
              child: SizedBox(
                height: 100,
                width: double.infinity,
                child: Center(child: Text('Filled Card')),
              ),
            ),
            horizontalDivider,
            const Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.pink),
              ),
              child: SizedBox(
                height: 100,
                width: double.infinity,
                child: Center(child: Text('Outline Card')),
              ),
            ),
            horizontalDivider,
          ],
        ),
      ),
    );
  }
}
