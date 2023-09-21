import 'package:flutter/material.dart';
import 'package:material_demo/lib.dart';

class ListCardPage extends StatefulWidget {
  const ListCardPage({super.key});

  @override
  State<ListCardPage> createState() => _ListCardPageState();
}

class _ListCardPageState extends State<ListCardPage> {
  List<bool> isSearched = List.generate(5, (index) => false);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: const Text('Add card'),
        ),
        body: Column(
          children: [
            SearchAnchor.bar(
              barLeading: const Icon(Icons.search),
              barHintText: 'Search',
              isFullScreen: false,
              suggestionsBuilder: ((context, controller) {
                return List<ListTile>.generate(5, (int index) {
                  final String item = 'item $index';
                  return ListTile(
                    title: Text(item),
                    onTap: () {
                      setState(() {
                        controller.closeView(item);
                      });
                    },
                  );
                });
              }),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                itemCount: 6,
                itemBuilder: (ctx, index) {
                  return CardWidget(
                      title: 'This is title of ${index + 1}',
                      subTitle: 'This is the subtitle of ${index + 1}');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
