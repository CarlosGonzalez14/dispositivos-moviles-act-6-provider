import 'package:flutter/material.dart';
import 'package:moviles_act_4/widgets/button.dart';

class ButtonRow extends StatelessWidget {
  const ButtonRow({super.key, required this.rowNumber});

  final int rowNumber;

  @override
  Widget build(BuildContext context) {
    final Map<int, List<String>> buttonLabels = {
      1: ["7", "8", "9", "/"],
      2: ["4", "5", "6", "x"],
      3: ["1", "2", "3", "-"],
      4: ["0", ".", "C", "+"],
    };

    final labels = buttonLabels[rowNumber] ?? [];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: labels.map((label) {
          return Button(
            buttonLabel: label,
            isColouredButton: label == "/" || label == "x" || label == "-" || label == "+",
          );
        }).toList(),
      ),
    );
  }
}
