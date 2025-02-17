import 'package:flutter/material.dart';
import 'package:moviles_act_4/provider/display_controller.dart';
import 'package:provider/provider.dart';


class Display extends StatelessWidget{
  const Display({super.key});

  @override
  Widget build(BuildContext context){
    String displayText = Provider.of<DisplayController>(context).displayText;
    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Container(
        width: double.infinity,
        height: 100,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black26),
          color: Colors.black12,
        ),
        child: Text(
          displayText,
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}