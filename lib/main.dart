
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Coachdata.dart';
import 'coach.dart';

void main() => runApp(mainPage());

class mainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFFE7E7EE),
        scaffoldBackgroundColor: Color(0xFFDBDBEA),
      ),
      //home: Homepage(),
      //home: ListofExercise(),
      //home: BMIcalculator(),
      //home: videoPage(),
      //home: Aboutuspage(),
      home: CoachData1(),
    );
  }
}


