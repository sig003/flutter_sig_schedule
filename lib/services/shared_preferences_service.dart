import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  SharedPreferences _prefs;

  SharedPreferencesService() {
    _initSharedPreferences();
  }

  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<String> getData() async {
    await _initSharedPreferences();
    return _prefs.getString('myData') ?? '';
  }

  Future<void> saveData(String data) async {
    await _initSharedPreferences();
    await _prefs.setString('myData', data);
  }

  Future<void> deleteData() async {
    await _initSharedPreferences();
    await _prefs.remove('myData');
  }
}