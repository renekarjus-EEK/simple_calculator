import 'package:flutter/material.dart';
import 'converter.dart';

import 'dart:math';   // needed for pow method

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Simple calculator';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const CalculatorForm(),
      ),
    );
  }
}

// Create a Form widget.
class CalculatorForm extends StatefulWidget {
  const CalculatorForm({Key? key}) : super(key: key);

  @override
  CalculatorFormState createState() {
    return CalculatorFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class CalculatorFormState extends State<CalculatorForm> {

  final firstNumberController = TextEditingController(); // text controller to retrieve the value of the first number
  final secondNumberController = TextEditingController();// text controller to retrieve the value of the second number

  double resultAdd = 0; //variables for results of operations
  double resultSubtract = 0;
  double resultMultiply = 0;
  double resultDivide = 0;
  num resultPower = 0;

  void calculate(firstNumber, secondNumber) {    //function for calculations, will not return anything, only does calculations
    final firstNumber = double.parse(firstNumberController.text);   //parse from string to double and assign value of the input text to variable.
    final secondNumber = double.parse(secondNumberController.text);
    setState(() {               //let flutter know that some object has changed
        resultAdd = firstNumber + secondNumber;
        resultSubtract = firstNumber - secondNumber;
        resultMultiply = firstNumber * secondNumber;
        resultDivide = firstNumber / secondNumber;
        resultPower = pow(firstNumber, secondNumber);
    });
  }

  void clearFields (){          //function to clear fields
    firstNumberController.clear();
    secondNumberController.clear();
    setState(() {               //let flutter know that some object has changed
      resultAdd = 0;
      resultSubtract = 0;
      resultMultiply = 0;
      resultDivide = 0;
      resultPower = 0;
    });
      }


  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),),

          TextFormField(                              //input field for first number
            controller: firstNumberController,
            onChanged: (text) {calculate(firstNumberController.text, secondNumberController.text);},  //calculate answers once a number has been entered
            decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: '1st number'
            ),
            keyboardType: TextInputType.number,    //keyboard with numbers
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),),

          TextFormField(                            //input field for second number
              controller: secondNumberController,
            onChanged: (text) {calculate(firstNumberController.text, secondNumberController.text);},
              decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: '2nd number'
            ),
            keyboardType: TextInputType.number,
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),),

          Text(                                                    //print calculation results
            firstNumberController.text +" + "+secondNumberController.text + " = " + resultAdd.toString(),
            style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Open Sans',
                  fontSize: 25),
          ),
          Text(
              firstNumberController.text +" - "+secondNumberController.text + " = " + resultSubtract.toString(),
            style: TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.w900,
                fontFamily: 'Open Sans',
                fontSize: 25),
          ),
          Text(
              firstNumberController.text +" x "+secondNumberController.text + " = " + resultMultiply.toString(),
            style: TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.w900,
                fontFamily: 'Open Sans',
                fontSize: 25),
          ),
          Text(
              firstNumberController.text +" : "+secondNumberController.text + " = " + resultDivide.toString(),
            style: TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.w900,
                fontFamily: 'Open Sans',
                fontSize: 25),          ),
          Text(
              firstNumberController.text +" ^ "+secondNumberController.text + " = " + resultPower.toString(),
            style: TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.w900,
                fontFamily: 'Open Sans',
                fontSize: 25),          ),
        ElevatedButton(
            onPressed: clearFields,
            child: const Text('Clear fields'),
            ),

          ElevatedButton(
          child: const Text('Use km to miles converter'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Converter()),
            );
            },
          ),
        ],
      ),
    );
  }
}



