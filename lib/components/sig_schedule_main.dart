import 'package:flutter/material.dart';

class SigScheduleMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SigSchedule'),
      ),
      body: Center(
        child: Text('Main'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'favorite'
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
      ),
    );
  }
}