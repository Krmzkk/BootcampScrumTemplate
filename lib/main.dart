import 'package:calculator/tasarim.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

//Hesap Makinesi

void main() => runApp(Hesapmakinesi());

class Hesapmakinesi extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Anaekran(),
    );
  }
}

class Anaekran extends StatefulWidget {
  @override
  _Anaekran createState() => _Anaekran();
}

class _Anaekran extends State<Anaekran> {
var userInput = '';
var answer = '';

// Tuşlar
static const List<String> buttons = 

['Flttr193','TEMİZLE', 'SİL' , 'x', 
'7', '8', '9', '/', 
'4', '5', '6', '+', 
'1', '2', '3', '-', 
'0', '00', '.', '=',];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 10, top: 40, left: 10),
                    alignment: Alignment.centerRight,
                    child: Text(
                      userInput,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.cyan,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10, left: 10),
                    alignment: Alignment.centerRight,
                    child: Text(
                      answer,
                      style: TextStyle(
                        fontSize: 48,
                        color: Colors.cyanAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (BuildContext context, int index) {

                  if (index == 1) {
                    return Tasarim(
                      buttontapped: () {
                        setState(() {
                          userInput = '';
                          answer = '0';
                        });
                      },
                      buttonText: buttons[index],
           
                      color: Colors.cyanAccent,
                      textColor: Colors.black,
                    );
                  }


  else if (index == 0) {
                    return Tasarim(
                          buttontapped: () {
                        setState(() {
                          userInput = '';
                          answer = 'Flutter Takım 193';
                        });
                      },
                      buttonText: buttons[index],
           
                      color: Colors.cyanAccent,
                      textColor: Colors.black,


                    );
                
                  }
                  else if (index == 2) {
                    return Tasarim(
                      buttontapped: () {
                        setState(() {
                          userInput =
                              userInput.substring(0, userInput.length - 1);
                        });
                      },
                      buttonText: buttons[index],
                      color: Colors.cyanAccent,
                      textColor: Colors.black,


                    );
                
                  }

                  else if (index == 19) {
                    return Tasarim(
                      buttontapped: () {
                        setState(() {
                          equalPressed();
                        });
                      },
                      buttonText: buttons[index],
                      color: Colors.cyanAccent,
                      textColor: Colors.black,
                    );
                  }

                  else {
                    return Tasarim(
                      buttontapped: () {
                        setState(() {
                    userInput += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: isOperator(buttons[index])
                          ? Colors.cyanAccent
                          : Colors.cyan.shade600,
                      textColor: isOperator(buttons[index])
                          ? Colors.black
                          : Colors.black,
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isOperator(String o) {
    if (o == '/' || o == 'x' || o == '-' || o == '+' || o == '=') {
      return true;
    }

    return false;
  }

  // Hesaplama
  
    void equalPressed() {
    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }
  

  
  }