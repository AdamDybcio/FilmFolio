import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_bloc_app/core/dependency_injection/di.dart';
import 'package:movie_bloc_app/core/settings/user_settings.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitial()) {
    on<ChangeSettings>((event, emit) {
      emit(SettingsChanging());

      if (event.language != null) {
        sl<UserSettings>().setLanguage(event.language!);
      }

      if (event.includeAdult != null) {
        sl<UserSettings>().setAdultContent(event.includeAdult!);
      }

      if (event.apiKey != null) {
        sl<UserSettings>().setApiKey(event.apiKey!);
      }

      if (event.themeMode != null) {
        if (event.themeMode == 'dark') {
          sl<UserSettings>().setThemeMode('dark');
        } else if (event.themeMode == 'light') {
          sl<UserSettings>().setThemeMode('light');
        } else {
          sl<UserSettings>().setThemeMode('auto');
        }
      }

      emit(SettingsChanged(
        sl<UserSettings>().getSettings()['include_adult'],
        sl<UserSettings>().getSettings()['language'],
        sl<UserSettings>().getSettings()['api_key'],
        'auto',
      ));
    });
  }
}
