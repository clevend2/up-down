import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:up_down_app/model/action_levels.dart';

Map<ActionLevels, String> levelNames = {
  ActionLevels.little: 'Little',
  ActionLevels.usual: 'Usual',
  ActionLevels.big: 'Big',
  ActionLevels.bigbig: 'Big Big',
};

class LevelSelector extends StatelessWidget {
  final int level;
  final Function(int) onLevelChanged;

  const LevelSelector({
    Key? key,
    required this.level,
    required this.onLevelChanged,
  }) : super(key: key);

  /// builds a series of buttons next to each other for each level in one row
  /// the selected level is highlighted      
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < ActionLevels.values.length; i++)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: ElevatedButton(
              onPressed: () => onLevelChanged(i),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  i == level ? Colors.blue : Colors.grey,
                ),
              ),
              child: Text(levelNames[ActionLevels.values[i]]!),
            ),
          ),
      ],
    );
  }
}