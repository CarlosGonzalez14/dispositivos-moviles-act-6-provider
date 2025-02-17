import 'package:flutter/material.dart';
import 'package:moviles_act_4/widgets/button_row.dart';
import 'package:moviles_act_4/widgets/display.dart';
import 'package:moviles_act_4/widgets/equals_row.dart';

class CalculadoraScreen extends StatefulWidget {
  const CalculadoraScreen({super.key});

  @override
  _CalculadoraScreenState createState() => _CalculadoraScreenState();
}

class _CalculadoraScreenState extends State<CalculadoraScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Display(),
          SizedBox(height: 10,),
          Expanded(
            child: Column(
              children: [
                ButtonRow(rowNumber: 1,),
                ButtonRow(rowNumber: 2,),
                ButtonRow(rowNumber: 3,),
                ButtonRow(rowNumber: 4,),
                EqualsRow(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
