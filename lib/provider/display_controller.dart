import 'package:flutter/material.dart';

class DisplayController extends ChangeNotifier{
  String _displayText = "";
  String? _operator;
  double? _firstValue, _secondValue;

  String get displayText => _displayText;

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
            _firstValue = null;
            _secondValue = null;
            _operator = null;
          }
        case 'C':
          _firstValue = null;
          _operator = null;
          _secondValue = null;
          _displayText = '';
      }
      notifyListeners();
  }
}