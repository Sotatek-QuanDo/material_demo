import 'package:flutter/material.dart';

enum Calendar { day, week, month, year }

class ButtonPage extends StatefulWidget {
  const ButtonPage({super.key});

  @override
  State<ButtonPage> createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  List<bool> isSearched = List.generate(5, (index) => false);
  Calendar calendarView = Calendar.day;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Material 3'),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
              ),
            ),
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
        body: Column(
          children: [
            buildHighEmphasisButton(),
            buildMediumEmphasis(),
            buildLowEmphasisButton(),
          ],
        ),
      ),
    );
  }

  Widget buildHighEmphasisButton() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Text(
              'High Emphasis Button',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          FloatingActionButton.extended(
            onPressed: () {},
            label: const Text('Extended Float Button'),
            tooltip: 'Create, Compose, New thread, New file',
          ),
          FloatingActionButton(
            onPressed: () {},
            child: const Text('Create'),
          ),
          FilledButton(
            onPressed: () {},
            child: const Text(
              'Filled Button',
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMediumEmphasis() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Medium Emphasis Button',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          FilledButton.tonal(
            onPressed: () {},
            child: const Text(
              'Filled Button Tonal',
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              'Elevated Button',
            ),
          ),
          OutlinedButton(
            onPressed: () {},
            child: const Text(
              'Outlined Button',
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLowEmphasisButton() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Low Emphasis Button',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Text Button',
            ),
          ),
          SegmentedButton<Calendar>(
            segments: const <ButtonSegment<Calendar>>[
              ButtonSegment<Calendar>(
                  value: Calendar.week,
                  label: Text('Week'),
                  icon: Icon(Icons.calendar_view_week)),
              ButtonSegment<Calendar>(
                  value: Calendar.month,
                  label: Text('Month'),
                  icon: Icon(Icons.calendar_view_month)),
              ButtonSegment<Calendar>(
                  value: Calendar.year,
                  label: Text('Year'),
                  icon: Icon(Icons.calendar_today)),
            ],
            selected: <Calendar>{calendarView},
            onSelectionChanged: (Set<Calendar> newSelection) {
              setState(() {
                calendarView = newSelection.first;
              });
            },
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
    );
  }
}
