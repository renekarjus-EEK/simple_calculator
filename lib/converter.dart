import 'package:flutter/material.dart';

class Converter extends StatelessWidget {
  const Converter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Km to miles converter"),
      ),
      body: const ConverterForm(),
    );
  }
}

// Define a custom Form widget.
class ConverterForm extends StatefulWidget {
  const ConverterForm({Key? key}) : super(key: key);

  @override
  ConverterFormState createState() {
    return ConverterFormState();
  }
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class ConverterFormState extends State<ConverterForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final kmController = TextEditingController();
  final milesController = TextEditingController();

double kmToMiles = 0;
double milesToKm = 0;

void convertKmToMiles (km){
  final km = double.parse(kmController.text);
  setState(() {
    kmToMiles = km * 0.621371;
  });
}

void convertMilesToKm (miles){
    final miles = double.parse(milesController.text);
    setState(() {
      milesToKm = miles * 1.60934;
    });
  }

  void clearConverterFields (){          //function to clear fields
    kmController.clear();
    milesController.clear();
    setState(() {               //let flutter know that some object has changed
      kmToMiles = 0;
      milesToKm = 0;
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

              TextFormField(                              //input field for km
                controller: kmController,
                onChanged: (text) {convertKmToMiles(kmController.text);},  //convert
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter kilometers'
                ),
                keyboardType: TextInputType.number,    //keyboard with numbers
              ),

              const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),),

              Text(                                                    //print conversion results
              kmController.text +" kilometers is " + kmToMiles.toStringAsFixed(2)+" miles ",  //round to two decimals
              style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.w900,
              fontFamily: 'Open Sans',
              fontSize: 25),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),),

              TextFormField(                            //input field for miles
                controller: milesController,
                onChanged: (text) {convertMilesToKm(milesController.text);},
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter miles'
                ),
                keyboardType: TextInputType.number,
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),),

              Text(                                                    //print conversion results
              milesController.text +" miles is " + milesToKm.toStringAsFixed(2)+" kilometers ",
              style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.w900,
              fontFamily: 'Open Sans',
              fontSize: 25),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),),

              ElevatedButton(
                onPressed: clearConverterFields,
                child: const Text('Clear fields'),
              ),

              ElevatedButton(                   //button to go back to calculator
              onPressed: () {
              Navigator.pop(context);
              },
              child: const Text('Use simple calculator'),
              ),
            ],
        ),
    );
  }
}


