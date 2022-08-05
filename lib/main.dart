import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(
      MaterialApp(
        home: BallPage(),
      ),
    );

class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          'Ask Me Anything',
          style: GoogleFonts.sacramento(
            fontSize: 38.0,
          ),
        ),
      ),
      body: Ball(),
    );
  }
}

class Ball extends StatefulWidget {
  @override
  State<Ball> createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballAnswerNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: TextButton(
          onPressed: () => getAnswerFromTheBall(),
          child: Image.asset('images/ball$ballAnswerNumber.png'),
        ),
      ),
    );
  }

  void getAnswerFromTheBall() =>
      setState(() => ballAnswerNumber = Random().nextInt(5) + 1);
}
