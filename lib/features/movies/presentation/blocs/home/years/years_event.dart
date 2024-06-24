part of 'years_bloc.dart';

sealed class YearsEvent extends Equatable {
  const YearsEvent();

  @override
  List<Object> get props => [];
}

final class YearsChangeEvent extends YearsEvent {
  final int year;

  const YearsChangeEvent(this.year);

  @override
  List<Object> get props => [year];
}
