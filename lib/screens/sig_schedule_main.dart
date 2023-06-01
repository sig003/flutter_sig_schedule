import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sig_schedule/services/shared_preferences_service.dart';

class SigScheduleMain extends StatefulWidget {
  @override
  State<SigScheduleMain> createState() => _SigScheduleMainState();
}

class _SigScheduleMainState extends State<SigScheduleMain> {
  SharedPreferencesService _sharedPreferencesService = SharedPreferencesService();
  String _myData = '';

  @override
  void initState() {
    super.initState();

    _initSharedPreferences();
  }

  Future<void> _initSharedPreferences() async {
    _myData = await _sharedPreferencesService.getData();
    setState(() {});
  }

  Future<void> _saveData(String data) async {
    await _sharedPreferencesService.saveData(data);
    setState(() {
      _myData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SigSchedule'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
            child: Card(
              child: ListTile(
                title: Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text('약 먹기'),
                ),
                subtitle: Text('2023.06.01. 13:00'),
                trailing: Icon(Icons.delete),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
            child: Card(
              child: ListTile(
                title: Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text('약 먹기'),
                ),
                subtitle: Text('2023.06.01. 13:00'),
                trailing: Icon(Icons.delete),
              ),
            ),
          ),
        ],
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