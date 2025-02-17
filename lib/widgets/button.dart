import 'package:flutter/material.dart';
import 'package:moviles_act_4/provider/display_controller.dart';
import 'package:provider/provider.dart';


class Button extends StatelessWidget{
  const Button({super.key, required this.buttonLabel, required this.isColouredButton});

  final String buttonLabel;
  final bool isColouredButton;

  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
    DisplayController displayController = Provider.of<DisplayController>(context, listen: false);
    
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: ElevatedButton(
          // onPressed: () => {},
          onPressed: () => displayController.displayText = buttonLabel,
          style:isColouredButton == true ?
           ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor:  theme.colorScheme.inversePrimary,
              foregroundColor: Colors.white,
            ) : 
            ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          child: Text(buttonLabel),
        ),
      ),
    );
  }
}