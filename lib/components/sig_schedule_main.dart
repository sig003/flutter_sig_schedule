import 'package:flutter/material.dart';

class SigScheduleMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SigSchedule'),
      ),
      body: Scrollbar(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Card(
                child: ListTile(
                  title: Text('약 먹기'),
                  subtitle: Text('2023.06.01. 13:00'),
                  trailing: Icon(Icons.delete),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Card(
                child: ListTile(
                  title: Text('약 먹기'),
                  subtitle: Text('2023.06.01. 13:00'),
                  trailing: Icon(Icons.delete),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Card(
                child: ListTile(
                  title: Text('약 먹기'),
                  subtitle: Text('2023.06.01. 13:00'),
                  trailing: Icon(Icons.delete),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Card(
                child: ListTile(
                  title: Text('약 먹기'),
                  subtitle: Text('2023.06.01. 13:00'),
                  trailing: Icon(Icons.delete),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Card(
                child: ListTile(
                  title: Text('약 먹기'),
                  subtitle: Text('2023.06.01. 13:00'),
                  trailing: Icon(Icons.delete),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Card(
                child: ListTile(
                  title: Text('약 먹기'),
                  subtitle: Text('2023.06.01. 13:00'),
                  trailing: Icon(Icons.delete),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Card(
                child: ListTile(
                  title: Text('약 먹기'),
                  subtitle: Text('2023.06.01. 13:00'),
                  trailing: Icon(Icons.delete),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Card(
                child: ListTile(
                  title: Text('약 먹기2'),
                  subtitle: Text('2023.06.01. 13:00'),
                  trailing: Icon(Icons.delete),
                ),
              ),
            ),
          ],
      ),
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