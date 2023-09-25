import 'package:flutter/material.dart';
import 'package:material_demo/lib.dart';

class OtherPage extends StatefulWidget {
  const OtherPage({super.key});

  @override
  State<OtherPage> createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  int _currrentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: NavigationDrawer(
        selectedIndex: _currrentIndex,
        onDestinationSelected: (value) {
          setState(() {
            _currrentIndex = value;
            Navigator.of(context).pop();
          });
        },
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text(
              'Header',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.widgets_outlined),
            label: Text('Dialog'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.format_paint_outlined),
            label: Text('Sheet'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.opacity),
            label: Text(
              'Progress Indicator',
            ),
          ),
          const Divider(
            indent: 20,
            endIndent: 20,
          ),
        ],
      ),
      body: <Widget>[
        const DialogPage(),
        const SheetPage(),
        const ProgressIndicatorPage(),
      ][_currrentIndex],
    );
  }
}
