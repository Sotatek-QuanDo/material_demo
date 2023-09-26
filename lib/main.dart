import 'package:flutter/material.dart';
import 'package:material_demo/lib.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Future.delayed(const Duration(seconds: 10));
  runApp(const MainApp());
  FlutterNativeSplash.remove();
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
    loadConfig();
    super.initState();
  }

  void loadConfig() async {
    await ColorScheme.fromImageProvider(
            provider: Assets.images.splash.provider(),
            brightness: Brightness.dark)
        .then((newScheme) {
      setState(() {
        seed = newScheme;
      });
    });
    print('RUN SECOND');
  }

  @override
  Widget build(BuildContext context) {
    print('RUN FIRST');

    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: seed,
      ),
      home: const MainNavigator(),
    );
  }
}
