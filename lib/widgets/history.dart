import 'package:flutter/material.dart';
import 'package:moviles_act_4/provider/display_controller.dart';
import 'package:provider/provider.dart';


class History extends StatelessWidget{
  const History({super.key});

  @override
  Widget build(BuildContext context){
    List<String> calculationHistory = Provider.of<DisplayController>(context).calculationHistory;
    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Container(
          width: double.infinity,
          height: 240,
          alignment: Alignment.centerRight,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black26),
            color: Colors.black12,
          ),
          child: ListView.builder(
            itemCount: calculationHistory.length,
            itemBuilder: (context,index) {
              return Text((index+1).toString() + ".- " + calculationHistory[index]);
            }
          )
        ),
    );
  }
}