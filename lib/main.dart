import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'MyCalculator', //title while minimizing
      theme: ThemeData(
          //define the brightness and colors
          primaryColor: Colors.orange,
          brightness: Brightness.light),
      home: MyCalculator(),
    ));

class MyCalculator extends StatefulWidget {
  @override
  _MyCalculatorState createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  var _values = "Addition";
  var _operation = ['Addition', 'Subtraction', 'Division', 'Multiplication'];

  TextEditingController textbox1 = TextEditingController();
  TextEditingController textbox2 = TextEditingController();
  var _displaytext = "";
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
        appBar: AppBar(title: Text('Calculator')),
        body: ListView(
          padding: EdgeInsets.all(5),
          children: <Widget>[
            DropdownButton<String>(
              value: _values,
              style: textStyle,
              items: _operation.map((String values) {
                return DropdownMenuItem<String>(
                    value: values, child: Text(values));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _values = value;
                  print("value is changed to $value");
                });
              },
            ),

            // second item
            TextField(
              controller: textbox1,
              style: textStyle,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "First Number",
                  hintText: "100",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            ),
            Padding(padding: EdgeInsets.only(bottom: 5.0)),
            //third item
            TextField(
              controller: textbox2,
              style: textStyle,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Second Number",
                  hintText: "100",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            ),

            Padding(padding: EdgeInsets.only(bottom: 5.0),),
            //forth item
            Text(_displaytext, style: TextStyle(fontSize: 20.0),),
            //fifth item

            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        _calculate();  
                      });
                    },
                    child: Text("Calculate"),
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                       _clearAll(); 
                      });
                    },
                    child: Text("Clear"),
                    
                  ),
                )
              ],
            )
          ],
        ));
  }
  void _clearAll(){
      textbox1.text = "";
      textbox2.text = "";
  }
  void _calculate(){
    double first = double.parse(textbox1.text);
    double second = double.parse(textbox2.text);

    switch(_values)
    {
      case "Addition":
          _displaytext = "Result: ${first +second}";
          break;
      case "Subtraction":
          _displaytext = "Result: ${first - second}";
          break;
      case "Divide":
          _displaytext = "Result: ${first /second}";
          break;
      case "Multiplication":
          _displaytext = "Result: ${first *second}";
          break;
    }
  }
}
