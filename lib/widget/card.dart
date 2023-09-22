import 'package:flutter/material.dart';
import 'package:material_demo/lib.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.black.withOpacity(0.3),
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: Assets.images.example.provider(),
            width: double.infinity,
            fit: BoxFit.fitWidth,
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              subTitle,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                FilledButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const CardDetailPage(
                            title: 'Title',
                          );
                        },
                      ),
                    );
                  },
                  child: const Text(
                    'View',
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('View more'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
