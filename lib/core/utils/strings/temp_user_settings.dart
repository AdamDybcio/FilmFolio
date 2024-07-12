import 'package:movie_bloc_app/core/utils/strings/api_strings.dart';

class TempUserSettings {
  Map<String, dynamic> settings = {
    'api_key': ApiStrings.apiKey,
    'language': 'en-US',
    'include_adult': true,
  };
}
