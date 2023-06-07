import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  SharedPreferences? _prefs;

  SharedPreferencesService() {
    _initSharedPreferences();
  }

  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> init() async {
    await _initSharedPreferences();
  }

  Future<String> getData() async {
    await init();
    return _prefs!.getString('myData') ?? ''; // 기본값으로 빈 문자열 사용
  }

  Future<void> saveData(String data) async {
    await init();
    await _prefs!.setString('myData', data);
  }

  Future<void> deleteData() async {
    await init();
    await _prefs!.remove('myData');
  }
}