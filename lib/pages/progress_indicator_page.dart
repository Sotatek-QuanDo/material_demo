import 'package:flutter/material.dart';

class ProgressIndicatorPage extends StatefulWidget {
  const ProgressIndicatorPage({super.key});

  @override
  State<ProgressIndicatorPage> createState() => _ProgressIndicatorPageState();
}

class _ProgressIndicatorPageState extends State<ProgressIndicatorPage>
    with TickerProviderStateMixin {
  late AnimationController controller;
  bool isLoading = false;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    controller.stop();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Progress indicator',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 30),
            CircularProgressIndicator(
              value: controller.value,
            ),
            const SizedBox(
              height: 50,
            ),
            LinearProgressIndicator(
              value: controller.value,
            ),
            const SizedBox(height: 10),
            Row(
              children: <Widget>[
                const Expanded(
                  child: Text(
                    ' Load',
                  ),
                ),
                Switch(
                  value: isLoading,
                  onChanged: (bool value) {
                    setState(() {
                      isLoading = value;
                      if (!isLoading) {
                        controller.stop();
                      } else {
                        controller
                          ..forward(from: controller.value)
                          ..repeat();
                      }
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
