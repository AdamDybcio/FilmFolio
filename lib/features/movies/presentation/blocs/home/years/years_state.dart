part of 'years_bloc.dart';

sealed class YearsState extends Equatable {
  const YearsState();

  @override
  List<Object> get props => [];
}

final class YearsInitial extends YearsState {
  final int year = DateTime.now().year;

  YearsInitial();

  @override
  List<Object> get props => [year];
}

final class YearsChanged extends YearsState {
  final int year;

  const YearsChanged(this.year);

  @override
  List<Object> get props => [year];
}
