import 'package:flutter/material.dart';
import 'package:material_demo/lib.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late final ColorScheme seed;
  @override
  void initState() {
    ColorScheme.fromImageProvider(provider: Assets.images.example.provider())
        .then((newScheme) {
      setState(() {
        seed = newScheme;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: seed,
      ),
      home: const MainNavigator(),
    );
  }
}
