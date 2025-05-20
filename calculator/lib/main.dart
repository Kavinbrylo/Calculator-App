import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double size = 0;
  String inputvalue = '';
  String calulatedvalue = '';
  String operator = '';
  
  @override
  Widget build(BuildContext context) {

     size = MediaQuery.of(context).size.width / 5;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text("Calculator App"),
        ),
        body: ListView(
          children: [
            Container(
              alignment: Alignment.bottomRight,
              child: Text(inputvalue,style: const TextStyle(color: Colors.white,fontSize: 100),),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Calculator('7',Colors.white),
                    Calculator('8',Colors.white),
                    Calculator('9',Colors.white),
                    Calculator('x',Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    Calculator('4',Colors.white),
                    Calculator('5',Colors.white),
                    Calculator('6',Colors.white),
                    Calculator('-',Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    Calculator('1',Colors.white),
                    Calculator('2',Colors.white),
                    Calculator('3',Colors.white),
                    Calculator('+',Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    Calculator('0',Colors.white),
                    Calculator('.',Colors.white),
                    Calculator('=',Colors.green),
                    Calculator('/',Colors.orange),
                  ],
                ),
              ],
            ),
            Calculator('clear',Colors.red),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  Widget Calculator(String text,Color bgColor)
  {
    return InkWell(
      onTap: () {
        if (text == 'clear') {
          setState(() {
            inputvalue = '';
            calulatedvalue = '';
            operator = '';
          });
        }  else if (text == '+' || text == '-' ||text == 'x' ||text == '/'){
          setState(() {
            calulatedvalue = inputvalue;
            inputvalue = " ";

            operator = text;
          });
        }
        else if (text == '=') {
          setState(() {
            double Calcu = double.parse(calulatedvalue);
            double input = double.parse(inputvalue);

            if (operator == '+') {
              inputvalue = (Calcu + input).toString();
            }
            else if (operator == '-') {
              inputvalue = (Calcu - input).toString();
            }
            else if (operator == 'x') {
              inputvalue = (Calcu * input).toString();
            }
            else if (operator == '/') {
              inputvalue = (Calcu / input).toString();
            }
          });
        }
        else {
          setState(() {
          inputvalue = inputvalue + text;
        });
        }  
      },
      child: Container(
                        decoration: BoxDecoration(
                          color:bgColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        margin: const EdgeInsets.all(10),
                        height: size,
                        width: size,
                        alignment: Alignment.center,
                        child: Text(
                          text,
                          style: const TextStyle(color: Colors.black, fontSize: 30),
                        ),
                      ),
    );
  }
}
