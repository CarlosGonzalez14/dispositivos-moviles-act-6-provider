import 'package:flutter/material.dart';

class DisplayController extends ChangeNotifier{
  String _displayText = "", _calculation = "";
  List<String> _calculationHistory = [];
  String? _operator;
  double? _firstValue, _secondValue;
  bool _newOperation = true;

  String get displayText => _displayText;
  List<String> get calculationHistory => _calculationHistory;

  set displayText(String value){
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
          if(_displayText == '+' || _displayText == '-' || _displayText == 'x' || _displayText == '/')
          {
            _operator = _displayText;
            _displayText = value;
          }
          else
          {
            if(_newOperation == true)
            {
              _displayText = "";
              _newOperation = false;
            }
            _displayText += value;
          }
          break;
        case '+':
        case '-':
        case 'x':
        case '/':
          if(_displayText != '' && _displayText != '/' && _displayText != 'x' && _displayText != '-' && _displayText != '+' && _firstValue == null){
            _firstValue = double.parse(_displayText);
            _displayText = value;
          }
          break;
        case '=':
          if(_displayText != '' && _operator != null)
          {
            _secondValue = double.parse(_displayText);
            switch(_operator)
            {
              case '+':
              _displayText = ((_firstValue ?? 0.0) + (_secondValue ?? 0.0)).toString();
                break;
              case '-':
              _displayText = ((_firstValue ?? 0.0) - (_secondValue ?? 0.0)).toString();
                break;
              case 'x':
              _displayText = ((_firstValue ?? 0.0) * (_secondValue ?? 0.0)).toString();
                break;
              case '/':
              _displayText = ((_firstValue ?? 0.0) / (_secondValue ?? 0.0)).toString();
                break;
            }
            _calculation = "$_firstValue $_operator $_secondValue = $_displayText";
            _calculationHistory.add(_calculation);

            _calculation = "";
            _firstValue = null;
            _secondValue = null;
            _operator = null;
            _newOperation = true;
          }
          break;
        case 'C':
          clearScreen();
          break;
      }
      notifyListeners();
  }

  void clearScreen()
  {
    _firstValue = null;
    _operator = null;
    _secondValue = null;
    _newOperation = true;
    _displayText = '';
    notifyListeners();
  }
}