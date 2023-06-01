import 'package:flutter/material.dart';
import 'package:sig_schedule/screens/sig_schedule_main.dart';

void main() {
  runApp(SigSchedule());
}

class SigSchedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SigScheduleMain(),
    );
  }
}