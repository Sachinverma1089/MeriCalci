// import 'dart:math' as math;
import 'package:math_expressions/math_expressions.dart';
import 'package:calculator/colors.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorApp(),
    ));

class CalculatorApp extends StatefulWidget {
  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  double firstNum = 0.0;

  double secondNum = 0.0;

  var input = '';

  var output = '';

  var operation = '';

  onButtonClick(value) {
    print(value);
    // if value is AC
    if (value == "AC") {
      input = '';
      output = '';
    } else if (value == '<') {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if (value == "=") {
      if (input.isNotEmpty) {
        var userInput = input;
        userInput = input.replaceAll("x", "*");
        Parser p = Parser();
        Expression expression = p.parse(userInput);
        ContextModel cm = ContextModel();
        var finalValue = expression.evaluate(EvaluationType.REAL, cm);
        output = finalValue.toString();
      }
    } else {
      input = input + value;
    }
    ;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Meri Calci",
        ),
        backgroundColor: orangeColor,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          //input output area
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(input,
                      style: TextStyle(fontSize: 48, color: Colors.white)),
                  SizedBox(
                    height: 20,
                  ),
                  Text(output,
                      style: TextStyle(
                          fontSize: 34, color: Colors.white.withOpacity(0.7))),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),

          //buttonarea
          Row(
            children: [
              button(
                  text: 'AC',
                  buttonbgColor: operatorColor,
                  tColor: orangeColor),
              button(
                text: '<',
                buttonbgColor: operatorColor,
                tColor: orangeColor,
              ),
              button(
                  text: '(', buttonbgColor: operatorColor, tColor: orangeColor),
              button(
                  text: '/', buttonbgColor: operatorColor, tColor: orangeColor)
            ],
          ),
          Row(
            children: [
              button(text: '7'),
              button(text: '8'),
              button(text: '9'),
              button(
                  text: 'x', buttonbgColor: operatorColor, tColor: orangeColor)
            ],
          ),
          Row(
            children: [
              button(text: '4'),
              button(text: '5'),
              button(text: '6'),
              button(
                  text: '-', buttonbgColor: operatorColor, tColor: orangeColor)
            ],
          ),
          Row(
            children: [
              button(text: '1'),
              button(text: '2'),
              button(text: '3'),
              button(
                  text: '+', buttonbgColor: operatorColor, tColor: orangeColor)
            ],
          ),
          Row(
            children: [
              button(
                  text: '%', buttonbgColor: operatorColor, tColor: orangeColor),
              button(text: '0'),
              button(text: '.'),
              button(text: '=', buttonbgColor: orangeColor)
            ],
          ),
        ],
      ),
    );
  }

  Widget button({text, tColor = Colors.white, buttonbgColor = buttonColor}) {
    return Expanded(
      child: Container(
          margin: EdgeInsets.all(8),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  padding: EdgeInsets.all(20),
                  primary: buttonbgColor),
              onPressed: () => onButtonClick(text),
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 18, color: tColor, fontWeight: FontWeight.bold),
              ))),
    );
  }
}
