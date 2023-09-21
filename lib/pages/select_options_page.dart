import 'package:flutter/material.dart';
import 'package:material_demo/lib.dart';

enum Animals { dog, cat, tiger, elephant }

class SelectOptionsPage extends StatefulWidget {
  const SelectOptionsPage({super.key});

  @override
  State<SelectOptionsPage> createState() => _SelectOptionsPageState();
}

class _SelectOptionsPageState extends State<SelectOptionsPage> {
  Animals? animal = Animals.dog;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Widgets for eachs requirement'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: 'One ',
              ),
              Tab(
                text: 'Multi ',
              ),
              Tab(
                text: 'Switch ',
              ),
              Tab(
                text: 'Chips',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            buildOneChoice(),
            buildMultiChoice(),
            buildSwitchChoice(),
            buildChipsChoice(),
          ],
        ),
      ),
    );
  }

  Widget buildOneChoice() {
    return Column(
      children: [
        horizontalDivider,
        const Text(
          'Using Radio/RadioLisTitle',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        RadioListTile(
          title: const Text('Dog'),
          value: Animals.dog,
          groupValue: animal,
          onChanged: (Animals? value) {
            setState(() {
              animal = value;
            });
          },
        ),
        RadioListTile(
          title: const Text('Cat'),
          value: Animals.cat,
          groupValue: animal,
          onChanged: (Animals? value) {
            setState(() {
              animal = value;
            });
          },
        ),
        RadioListTile(
          title: const Text('Tiger'),
          value: Animals.tiger,
          groupValue: animal,
          onChanged: (Animals? value) {
            setState(() {
              animal = value;
            });
          },
        ),
        RadioListTile(
          title: const Text('Elephant'),
          value: Animals.elephant,
          groupValue: animal,
          onChanged: (Animals? value) {
            setState(() {
              animal = value;
            });
          },
        ),
      ],
    );
  }

  List<bool> multiChoice = List.generate(5, (index) => false);

  Widget buildMultiChoice() {
    return Column(
      children: [
        horizontalDivider,
        const Text(
          'Using Checkbox/CheckBoxListTitle',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: ((context, index) {
              return CheckboxListTile(
                title: Text('$index'),
                subtitle: Text('This is subtitle of $index'),
                controlAffinity: ListTileControlAffinity.leading,
                dense: true,
                value: multiChoice[index],
                onChanged: (value) {
                  setState(() {
                    multiChoice[index] = !multiChoice[index];
                  });
                },
              );
            }),
          ),
        ),
      ],
    );
  }

  List<bool> switchChoice = List.generate(5, (index) => false);

  Widget buildSwitchChoice() {
    return Column(
      children: <Widget>[
        horizontalDivider,
        const Text(
          'Using Switch/SwitchListTitle',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Text(
          'Use switches (not radio buttons) if the items in a list can be independently controlled',
          style: TextStyle(fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: ((context, index) {
              return SwitchListTile(
                title: Text('Bulb $index'),
                subtitle: Text('Turn on/off bulb $index'),
                value: switchChoice[index],
                onChanged: (value) {
                  setState(() {
                    switchChoice[index] = !switchChoice[index];
                  });
                },
              );
            }),
          ),
        )
      ],
    );
  }

  List<bool> filterChips = List<bool>.generate(4, (index) => false);
  List<bool> inputChips = List<bool>.generate(4, (index) => false);
  int? _value = 1;

  Widget buildChipsChoice() {
    return Column(
      children: [
        const Text(
            'Filter chips use tags or descriptive words as a way to filter content.'),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 5,
              );
            },
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (ctx, index) {
              return FilterChip(
                  label: Text('FilterChip $index'),
                  selected: filterChips[index],
                  onSelected: (value) {
                    setState(() {
                      filterChips[index] = value;
                    });
                  });
            },
          ),
        ),
        const Text(
            'Action chips are a set of options which trigger an action related to primary content.'),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 5,
              );
            },
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (ctx, index) {
              return ActionChip(
                label: Text('ActionChip $index'),
                onPressed: () {},
              );
            },
          ),
        ),
        const Text(
            'Input chips represent a complex piece of information, such as an entity (person, place, or thing) or conversational text, in a compact form.'),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 5,
              );
            },
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (ctx, index) {
              return InputChip(
                  label: Text('InputChip $index'),
                  selected: inputChips[index],
                  onSelected: (value) {
                    setState(() {
                      inputChips[index] = value;
                    });
                  });
            },
          ),
        ),
        const Text(
          'ChoiceChips represent a single choice from a set.',
          textAlign: TextAlign.start,
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 5,
              );
            },
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (ctx, index) {
              return ChoiceChip(
                  label: Text('ChoiceChip $index'),
                  selected: index == _value,
                  onSelected: (value) {
                    setState(() {
                      _value = value ? index : null;
                    });
                  });
            },
          ),
        ),
      ],
    );
  }
}
