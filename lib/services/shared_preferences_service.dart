import 'package:shared_preferences/shared_preferences.dart';

// class SharedPreferencesService {
//   SharedPreferences? _prefs;
//
//   SharedPreferencesService() {
//     _initSharedPreferences();
//   }
//
//   Future<void> _initSharedPreferences() async {
//     _prefs = await SharedPreferences.getInstance();
//   }
//
//   Future<void> init() async {
//     await _initSharedPreferences();
//   }
//
//   Future<String> getData() async {
//     await init();
//     return _prefs!.getString('myData') ?? ''; // 기본값으로 빈 문자열 사용
//   }
//
//   Future<void> saveData(String data) async {
//     await init();
//     await _prefs!.setString('myData', data);
//   }
//
//   Future<void> deleteData() async {
//     await init();
//     await _prefs!.remove('myData');
//   }
// }

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:sig_schedule/models/task.dart';

class SharedPreferencesService {
  static const String _tasksKey = 'tasks';

  Future<List<Task>> getTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> taskStrings = prefs.getStringList(_tasksKey) ?? [];
    List<Task> tasks = [];
    for (String taskString in taskStrings) {
      Map<String, dynamic> taskMap = json.decode(taskString);
      tasks.add(Task.fromMap(taskMap));
    }
    return tasks;
  }

  Future<void> saveTasks(List<Task> tasks) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> taskStrings = tasks.map((task) => json.encode(task.toMap())).toList();
    await prefs.setStringList(_tasksKey, taskStrings);
  }
}