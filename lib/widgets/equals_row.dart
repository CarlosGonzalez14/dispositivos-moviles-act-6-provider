import 'package:flutter/material.dart';
import 'package:moviles_act_4/provider/display_controller.dart';
import 'package:provider/provider.dart';

class EqualsRow extends StatelessWidget {
  const EqualsRow({super.key});

  @override
  Widget build(BuildContext context) {
    DisplayController displayController = Provider.of<DisplayController>(context, listen: false);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 128, vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 5/2,
              child: ElevatedButton(
                onPressed: () => displayController.displayText = "=",
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor:
                      Theme.of(context).colorScheme.inversePrimary,
                  foregroundColor: Colors.white,
                ),
                child: Text('='),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
