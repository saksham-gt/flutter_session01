import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _principleController = TextEditingController();
  TextEditingController _termController = TextEditingController();
  TextEditingController _roiController = TextEditingController();
  double amount;

  double _calculate(double principle, double term, double roi) {
    double amt = principle + (principle * term * roi / 100);
    return amt;
  }

  @override
  Widget build(BuildContext context) {
    print('build is running');
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Simple Interest Calculator'),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _principleController,
                decoration: InputDecoration(
                  hintText: 'Enter an amount e.g. 12000',
                  labelText: 'Principle',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: _roiController,
              decoration: InputDecoration(
                hintText: 'e.g. 8',
                labelText: 'Rate of Interest',
              ),
            ),
            Row(
              children: [
                Expanded(
                  // width: 250,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _termController,
                    decoration: InputDecoration(
                      hintText: 'e.g. 5',
                      labelText: 'Term (in years)',
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text('Rupees'),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      amount = _calculate(
                          double.parse(_principleController.text),
                          double.parse(_termController.text),
                          double.parse(_roiController.text));
                      print(amount);
                      setState(() {});
                    },
                    child: Text('Calculate'),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Reset'),
                  ),
                )
              ],
            ),
            amount == null
                ? Text('')
                : Text(
                    'Your calculated amount after ${_termController.text} years is $amount')
          ],
        ),
      ),
    );
  }
}
