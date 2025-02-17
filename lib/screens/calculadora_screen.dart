import 'package:flutter/material.dart';
import 'package:moviles_act_4/widgets/button_row.dart';
import 'package:moviles_act_4/widgets/display.dart';
import 'package:moviles_act_4/widgets/equals_row.dart';
import 'package:moviles_act_4/widgets/history.dart';

class CalculadoraScreen extends StatefulWidget {
  const CalculadoraScreen({super.key});

  @override
  _CalculadoraScreenState createState() => _CalculadoraScreenState();
}

class _CalculadoraScreenState extends State<CalculadoraScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Display(),
          SizedBox(height: 10,),
          Container(
            child: Column(
              children: [
                ButtonRow(rowNumber: 1,),
                ButtonRow(rowNumber: 2,),
                ButtonRow(rowNumber: 3,),
                ButtonRow(rowNumber: 4,),
                EqualsRow(),
              ],
            ),
          ),
          SizedBox(height: 16,),
          Text(
            "Historial de Cálculos",
            style: theme.textTheme.titleLarge
          ),
          SizedBox(height: 8,),
          History(),
        ],
      ),
    );
  }
}
