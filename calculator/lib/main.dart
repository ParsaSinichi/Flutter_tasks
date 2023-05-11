import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Calculator ',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: simpleCalculator());
  }
}

class simpleCalculator extends StatefulWidget {
  const simpleCalculator({super.key});

  @override
  State<simpleCalculator> createState() => _simpleCalculatorState();
}

class _simpleCalculatorState extends State<simpleCalculator> {
    buttonPressed(  String buttonText){
        setState(() {
          if(buttonText=="C"){
              equation='0';
              result='0'; 
              equationFontSize = 38.0;
              resultFontSize = 48.0;
          }
          else if (buttonText=="del"){
            equationFontSize = 48.0;
            resultFontSize = 38.0;
              equation=equation.substring(0,equation.length-1);
              if(equation==''){
                equation="0";
              }
          }
          else if (buttonText=="="){
            
            equationFontSize = 38.0;
            resultFontSize = 48.0;
            expression=equation;
            try{
              Parser p=  Parser();
              Expression exp=p.parse(expression);
              ContextModel cm=ContextModel();
              result='${exp.evaluate(EvaluationType.REAL, cm)}';
            }
            catch(e){
              result="Error";
            }
          }
          else {
            if(equation=="0"){
              equation=buttonText;
            }else {
            equation=equation + buttonText;
            }
          }
          
        });

    }
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;
  Widget buildButton(
      String buttonText, double buttonHeight, Color buttonColor) {
    // TextButton(style: ButtonStyle(padding: EdgeInsets.all(16.0)),onPressed: (){},child: Text(
    //                     buttonText,
    //                     style: TextStyle(
    //                         fontSize: 30.0,
    //                         fontWeight: FontWeight.normal,
    //                         color: Colors.white),
    //                   ),
    //                   );
    return Container(
        height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
        color: buttonColor,
        //padding: EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: ()=> buttonPressed(buttonText),
            child: Text(
              buttonText,
              style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Column(children: [
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Text(
            equation,
            style: TextStyle(fontSize: equationFontSize),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
          child: Text(
            result,
            style: TextStyle(fontSize:resultFontSize),
          ),
        ),
        Expanded(
          child: Divider(),
        ),
        Row(
          //for bottom part
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.75,
              child: Table(
                children: [
                  TableRow(children: [
                    buildButton("C", 1, Colors.redAccent),
                    buildButton("del", 1, Colors.blue),
                    buildButton("/", 1, Colors.blue),
                  ]),
                  TableRow(children: [
                    buildButton("7", 1, Colors.black54),
                    buildButton("8", 1, Colors.black54),
                    buildButton("9", 1, Colors.black54),
                  ]),
                  TableRow(children: [
                    buildButton("4", 1, Colors.black54),
                    buildButton("5", 1, Colors.black54),
                    buildButton("6", 1, Colors.black54),
                  ]),
                  TableRow(children: [
                    buildButton("1", 1, Colors.black54),
                    buildButton("2", 1, Colors.black54),
                    buildButton("3", 1, Colors.black54),
                  ]),
                  TableRow(children: [
                    buildButton(".", 1, Colors.black54),
                    buildButton("0", 1, Colors.black54),
                    buildButton("00", 1, Colors.black54),
                  ])
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.25,
              child: Table(
                children: [
                  TableRow(children: [
                    buildButton("*", 1, Colors.blue),
                  ]),
                  TableRow(children: [
                    buildButton("-", 1, Colors.blue),
                  ]),
                  TableRow(children: [
                    buildButton("+", 1, Colors.blue),
                  ]),
                  TableRow(children: [
                    buildButton("=", 2, Colors.redAccent),
                  ]),
                ],
              ),
            )
          ],
        )
      ]),
    );
  }
}
