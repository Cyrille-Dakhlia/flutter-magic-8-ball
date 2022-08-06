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
  bool showFirst = true;
  int ballAnswerNumber1 = 1;
  int ballAnswerNumber2 = 2;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: TextButton(
          onPressed: () => changeBallAnswer(),
          child: AnimatedCrossFade(
            duration: const Duration(milliseconds: 1000),
            firstCurve: Curves.easeInCubic,
            secondCurve: Curves.easeInCubic,
            crossFadeState: showFirst
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            firstChild: Image.asset('images/ball$ballAnswerNumber1.png'),
            secondChild: Image.asset('images/ball$ballAnswerNumber2.png'),
          ),
        ),
      ),
    );
  }

  void changeBallAnswer() => setState(() {
        int nextBallAnswerNumber = Random().nextInt(5) + 1;
        showFirst
            ? ballAnswerNumber2 = nextBallAnswerNumber
            : ballAnswerNumber1 = nextBallAnswerNumber;
        showFirst = !showFirst;
      });
}
