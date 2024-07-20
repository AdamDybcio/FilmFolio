import 'package:hive_flutter/hive_flutter.dart';

class UserSettings {
  static final Map<String, dynamic> _defaultSettings = {
    'api_key': '',
    'language': 'en-US',
    'include_adult': true,
  };

  late Map<String, dynamic> _settings;

  UserSettings() {
    _settings = _defaultSettings;
    loadFromStorage();
  }

  Map<String, dynamic> getSettings() {
    return Map.from(_settings);
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
  }

  void loadFromStorage() async {
    try {
      var box = Hive.box('settings');
      var loadedSettings = box.get('settings', defaultValue: _settings);
      _settings = Map<String, dynamic>.from(loadedSettings);
    } catch (e) {
      var box = Hive.box('settings');
      box.put('settings', _defaultSettings);
      _settings = _defaultSettings;
    }
  }

  void reset() {
    var box = Hive.box('settings');
    box.clear();
    box.put('settings', _defaultSettings);
    _settings = _defaultSettings;
  }
}
