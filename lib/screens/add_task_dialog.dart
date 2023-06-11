import 'package:flutter/material.dart';
import 'package:sig_schedule/models/task.dart';

class AddTaskDialog extends StatefulWidget {
  final Function(Task) onAddTask;

  AddTaskDialog({required this.onAddTask});

  @override
  _AddTaskDialogState createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  late String _title;
  late DateTime _selectedDate;
  late TimeOfDay _selectedTime;

  @override
  void initState() {
    super.initState();
    _title = '';
    _selectedDate = DateTime.now();
    _selectedTime = TimeOfDay.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  void _addTask() {
    if (_title.trim().isEmpty) {
      return;
    }

    final Task newTask = Task(
      title: _title,
      date: _selectedDate,
      time: _selectedTime,
    );

    widget.onAddTask(newTask);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Task'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            onChanged: (value) {
              setState(() {
                _title = value;
              });
            },
          ),
          SizedBox(height: 16.0),
          Row(
            children: [
              Text('Date: ${_selectedDate.toString().substring(0, 10)}'),
              IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () {
                  _selectDate(context);
                },
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              Text('Time: ${_selectedTime.format(context)}'),
              IconButton(
                icon: Icon(Icons.access_time),
                onPressed: () {
                  _selectTime(context);
                },
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: Text('Save'),
          onPressed: _addTask,
        ),
      ],
    );
  }
}