import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UpDownSelector extends StatelessWidget {
  final int value;
  final Function(int) onValueChanged;

  const UpDownSelector({
    Key? key,
    required this.value,
    required this.onValueChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.arrow_drop_up),
          onPressed: () => onValueChanged(value + 1),
        ),
        IconButton(
          icon: Icon(Icons.arrow_drop_down),
          onPressed: () => onValueChanged(value - 1),
        ),
      ],
    );
  }
}