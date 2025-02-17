import 'package:flutter/material.dart';
import 'package:moviles_act_4/provider/display_controller.dart';
import 'package:moviles_act_4/widgets/button_row.dart';
import 'package:moviles_act_4/widgets/display.dart';
import 'package:moviles_act_4/widgets/equals_row.dart';
import 'package:provider/provider.dart';

void main() => runApp(
    MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => DisplayController()),
    ],
    child: Calculadora(),
  )
);

class Calculadora extends StatelessWidget {
  const Calculadora({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
      ),
      home: CalculadoraScreen(),
    );
  }
}

class CalculadoraScreen extends StatefulWidget {
  const CalculadoraScreen({super.key});

  @override
  _CalculadoraScreenState createState() => _CalculadoraScreenState();
}

class _CalculadoraScreenState extends State<CalculadoraScreen> {
  String displayText = "";

  void changeDisplay(String value) {
    setState(() {
      switch(value)
      {
        case '0':
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
          if(displayText == '+' || displayText == '-' || displayText == 'x' || displayText == '/' || displayText == '=')
          {
            displayText = value;
          }
          else
          {
            displayText += value;
          }
          break;
        case '+':
        case '-':
        case 'x':
        case '/':
        case '=':
          displayText = value;
        case 'C':
          displayText = '';
      }
    });
  }

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
