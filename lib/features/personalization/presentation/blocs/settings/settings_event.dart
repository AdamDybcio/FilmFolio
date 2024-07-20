part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class ChangeSettings extends SettingsEvent {
  final String? language;
  final bool? includeAdult;
  final String? apiKey;

  const ChangeSettings({this.language, this.includeAdult, this.apiKey});

  @override
  List<Object> get props => [language!, includeAdult!, apiKey!];
}
