import 'package:flutter/material.dart';

/// Flutter code sample for [SegmentedButton].

void main() {
  runApp(const SegmentedButtonApp());
}

class SegmentedButtonApp extends StatelessWidget {
  const SegmentedButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              SingleChoice(),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

enum OrdemItem { active, past }

class SingleChoice extends StatefulWidget {
  const SingleChoice({super.key});

  @override
  State<SingleChoice> createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  OrdemItem ordemItem = OrdemItem.active;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<OrdemItem>(
      segments: const <ButtonSegment<OrdemItem>>[
        ButtonSegment<OrdemItem>(
          value: OrdemItem.active,
          label: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Text(
              'Active orders',
            ),
          ),
        ),
        ButtonSegment<OrdemItem>(
          value: OrdemItem.past,
          label: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Text(
              'Past orders',
            ),
          ),
        ),
      ],
      selected: <OrdemItem>{ordemItem},
      style: ButtonStyle(
        // Change background color for selected state
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return Colors.blue; // Replace with your desired color
          }
          return null; // Use the default color for unselected states
        }),
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return Colors.white; // Selected text color
          }
          return Colors.blue; // Unselected text color
        }),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(color: Colors.grey, width: 3.0),
        ),
      ),
      showSelectedIcon: false,
      onSelectionChanged: (Set<OrdemItem> newSelection) {
        setState(() {
          ordemItem = newSelection.first;
        });
      },
    );
  }
}
