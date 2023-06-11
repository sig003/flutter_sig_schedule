import 'package:flutter/material.dart';

class Task {
  final String title;
  final DateTime date;
  final TimeOfDay time;

  Task({
    required this.title,
    required this.date,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'date': date.toIso8601String(),
      'time': time.toString(),
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'],
      date: DateTime.parse(map['date']),
      time: TimeOfDay.fromDateTime(DateTime.parse(map['time'])),
    );
  }
}