part of 'settings_bloc.dart';

sealed class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

final class SettingsInitial extends SettingsState {}

final class SettingsChanging extends SettingsState {}

final class SettingsChanged extends SettingsState {
  final bool showAdultContent;
  final String language;
  final String apiKey;
  final String themeMode;

  const SettingsChanged(this.showAdultContent, this.language, this.apiKey, this.themeMode);

  @override
  List<Object> get props => [showAdultContent, language, apiKey, themeMode];
}
