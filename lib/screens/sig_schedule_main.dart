import 'package:flutter/material.dart';
import 'package:sig_schedule/screens/add_task_dialog.dart';
import 'package:sig_schedule/services/shared_preferences_service.dart';
import 'package:sig_schedule/models/task.dart';

class SigScheduleMain extends StatefulWidget {
  @override
  State<SigScheduleMain> createState() => _SigScheduleMainState();
}

class _SigScheduleMainState extends State<SigScheduleMain> {
  SharedPreferencesService _sharedPreferencesService = SharedPreferencesService();
  List<Task> _tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    List<Task> tasks = await _sharedPreferencesService.getTasks();
    setState(() {
      _tasks = tasks;
    });
  }

  Future<void> _saveTask(Task task) async {
    _tasks.add(task);
    await _sharedPreferencesService.saveTasks(_tasks);
    setState(() {});
  }

  Future<void> _deleteTask(Task task) async {
    _tasks.remove(task);
    await _sharedPreferencesService.saveTasks(_tasks);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SigSchedule'),
      ),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          Task task = _tasks[index];
          return Padding(
            padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
            child: Card(
              child: ListTile(
                title: Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(task.title),
                ),
                subtitle: Text('${task.date} ${task.time}'),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _deleteTask(task);
                  },
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delete),
            label: 'trash',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: 'add',
          ),
        ],
        onTap: (int index) {
          if (index == 2) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AddTaskDialog(
                  onAddTask: _saveTask,
                );
              },
            );
          }
        },
      ),
    );
  }
}