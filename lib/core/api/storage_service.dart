import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static final authToken = 'jwt_token';
  static final userData = 'user_data';

  SharedPreferences? _sharedPreference;

  Future<SharedPreferences?> init() async {
    _sharedPreference ??= await SharedPreferences.getInstance();
    return _sharedPreference;
  }

  bool get isAuth => getData(authToken) != null;

  Future<bool> deleteDataByKey(String key) => _sharedPreference!.remove(key);

  void saveData(String key, dynamic value) =>
      _sharedPreference!.setString(key, value.toString());

  void saveBooleanData(String key, bool value) =>
      _sharedPreference!.setBool(key, value);

  bool? getBooleanData(String key) => _sharedPreference?.getBool(key);

  void deleteAllKeys() => _sharedPreference!.clear();

  bool containsKey(String keyDate) => _sharedPreference!.containsKey(keyDate);

  String? getData(String key) {
    if (_sharedPreference!.containsKey(key)) {
      return _sharedPreference!.get(key).toString();
    }
    return null;
  }

  List<String> getStringList({
    required String key,
    List<String> defaultValue = const [],
  }) {
    try {
      return _sharedPreference!.getStringList(key) ?? defaultValue;
    } catch (e) {
      print('Error reading string list for key "$key": $e');
      return defaultValue;
    }
  }

  /// Parameters:
  /// - key: The storage key to use
  /// - values: The list of strings to save
  /// - merge: If true, merges with existing values (default false)
  /// - unique: If true, ensures no duplicate values (default false)
  Future<bool> setStringList({
    required String key,
    required List<String> values,
    bool merge = false,
    bool unique = false,
  }) async {
    // Always create a new modifiable list
    List<String> finalValues = List.from(values);

    if (merge) {
      // Create modifiable copy of existing values
      final existing = List.from(_sharedPreference!.getStringList(key) ?? []);
      finalValues = [...existing, ...finalValues];
    }

    if (unique) {
      finalValues = finalValues.toSet().toList();
    }

    return await _sharedPreference!.setStringList(key, finalValues);
  }

  List<String> getAllKeysContainsSubString(String substring) {
    return _sharedPreference!
        .getKeys()
        .toList()
        .where((element) => element.contains(substring))
        .toList();
  }
}
