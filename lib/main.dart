import 'package:flutter/material.dart';
import 'package:moviles_act_4/provider/display_controller.dart';
import 'package:moviles_act_4/screens/calculadora_screen.dart';
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

