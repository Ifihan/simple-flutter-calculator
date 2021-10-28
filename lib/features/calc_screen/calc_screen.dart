import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';

class CalcApp extends StatefulWidget {
  const CalcApp({Key? key}) : super(key: key);

  @override
  CalcAppState createState() => CalcAppState();
}

class CalcAppState extends State<CalcApp> {
  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() => _expression += text);
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF283637),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Text(
                  _history,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Color(0xFF545F61),
                  ),
                ),
              ),
              alignment: const Alignment(1.0, 1.0),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  _expression,
                  style: const TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                  ),
                ),
              ),
              alignment: const Alignment(1.0, 1.0),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: 'AC',
                  fillColor: Colors.green,
                  textColor: Colors.white,
                  textSize: 24,
                  callback: allClear,
                ),
                CalcButton(
                  text: 'C',
                  fillColor: Colors.green,
                  textColor: Colors.white,
                  textSize: 30,
                  callback: clear,
                ),
                CalcButton(
                  text: '%',
                  fillColor: Colors.green,
                  textColor: Colors.white,
                  textSize: 30,
                  callback: numClick,
                ),
                CalcButton(
                  text: '/',
                  fillColor: Colors.green,
                  textColor: Colors.white,
                  textSize: 30,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '7',
                  callback: numClick,
                  fillColor: Colors.green,
                  textColor: Colors.white,
                  textSize: 30,
                ),
                CalcButton(
                  text: '8',
                  callback: numClick,
                  fillColor: Colors.green,
                  textColor: Colors.white,
                  textSize: 30,
                ),
                CalcButton(
                  text: '9',
                  callback: numClick,
                  fillColor: Colors.green,
                  textColor: Colors.white,
                  textSize: 30,
                ),
                CalcButton(
                  text: '*',
                  fillColor: Colors.green,
                  textColor: Colors.white,
                  textSize: 30,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '4',
                  callback: numClick,
                  fillColor: Colors.green,
                  textColor: Colors.white,
                  textSize: 30,
                ),
                CalcButton(
                  text: '5',
                  callback: numClick,
                  fillColor: Colors.green,
                  textColor: Colors.white,
                  textSize: 30,
                ),
                CalcButton(
                  text: '6',
                  callback: numClick,
                  fillColor: Colors.green,
                  textColor: Colors.white,
                  textSize: 30,
                ),
                CalcButton(
                  text: '-',
                  fillColor: Colors.green,
                  textColor: Colors.white,
                  textSize: 38,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '1',
                  callback: numClick,
                  fillColor: Colors.green,
                  textColor: Colors.white,
                  textSize: 30,
                ),
                CalcButton(
                  text: '2',
                  callback: numClick,
                  fillColor: Colors.green,
                  textColor: Colors.white,
                  textSize: 30,
                ),
                CalcButton(
                  text: '3',
                  callback: numClick,
                  fillColor: Colors.green,
                  textColor: Colors.white,
                  textSize: 30,
                ),
                CalcButton(
                  text: '+',
                  fillColor: Colors.green,
                  textColor: Colors.white,
                  textSize: 30,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalcButton(
                  text: '.',
                  callback: numClick,
                  textSize: 30,
                  fillColor: Colors.green,
                  textColor: Colors.white,
                ),
                CalcButton(
                  fillColor: Colors.green,
                  textColor: Colors.white,
                  text: '0',
                  callback: numClick,
                  textSize: 30,
                ),
                CalcButton(
                  textColor: Colors.white,
                  fillColor: Colors.blue,
                  text: '00',
                  callback: numClick,
                  textSize: 26,
                ),
                CalcButton(
                  text: '=',
                  textSize: 30,
                  fillColor: Colors.green,
                  textColor: Colors.white,
                  callback: evaluate,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CalcButton extends StatelessWidget {
  final String text;
  final Color fillColor;
  final Color textColor;
  final double textSize;
  final Function callback;

  const CalcButton({
    Key? key,
    required this.text,
    required this.fillColor,
    required this.textColor,
    required this.textSize,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: SizedBox(
        width: 65,
        height: 65,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
          onPressed: () {
            callback(text);
          },
          child: Text(
            text,
            style: TextStyle(
              fontSize: textSize,
            ),
          ),
        ),
      ),
    );
  }
}
