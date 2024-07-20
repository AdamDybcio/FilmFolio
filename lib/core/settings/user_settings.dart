import 'package:hive_flutter/hive_flutter.dart';

class UserSettings {
  static final Map<String, dynamic> _defaultSettings = {
    'api_key': '',
    'language': 'en-US',
    'include_adult': true,
  };

  late Map<String, dynamic> _settings;

  static const String _defaultThemeMode = 'auto';

  late String _themeMode;

  UserSettings() {
    _settings = _defaultSettings;
    _themeMode = _defaultThemeMode;
    loadFromStorage();
  }

  String getThemeMode() {
    return _themeMode;
  }

  Map<String, dynamic> getSettings() {
    return Map.from(_settings);
  }

  void setThemeMode(String themeMode) {
    _themeMode = themeMode;
    saveToStorage();
  }

  void setLanguage(String language) {
    _settings['language'] = language;
    saveToStorage();
  }

  void setAdultContent(bool includeAdult) {
    _settings['include_adult'] = includeAdult;
    saveToStorage();
  }

  void setApiKey(String apiKey) {
    _settings['api_key'] = apiKey;
    saveToStorage();
  }

  void saveToStorage() {
    Hive.box('settings').put('settings', _settings);
    Hive.box('theme_mode').put('theme_mode', _themeMode);
  }

  void loadFromStorage() async {
    try {
      var box = Hive.box('settings');
      var loadedSettings = box.get('settings', defaultValue: _settings);
      _settings = Map<String, dynamic>.from(loadedSettings);

      var boxTheme = Hive.box('theme_mode');
      var loadedTheme = boxTheme.get('theme_mode', defaultValue: _themeMode);
      _themeMode = loadedTheme as String;
    } catch (e) {
      var box = Hive.box('settings');
      box.put('settings', _defaultSettings);
      _settings = _defaultSettings;

      var boxTheme = Hive.box('theme_mode');
      boxTheme.put('theme_mode', _defaultThemeMode);
      _themeMode = _defaultThemeMode;
    }
  }

  void reset() {
    var box = Hive.box('settings');
    box.clear();
    box.put('settings', _defaultSettings);
    _settings = _defaultSettings;

    var boxTheme = Hive.box('theme_mode');
    boxTheme.clear();
    boxTheme.put('theme_mode', _defaultThemeMode);
    _themeMode = _defaultThemeMode;
  }
}
