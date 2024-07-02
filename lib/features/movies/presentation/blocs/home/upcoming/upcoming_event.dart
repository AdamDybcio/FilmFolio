part of 'upcoming_bloc.dart';

sealed class UpcomingEvent extends Equatable {
  const UpcomingEvent();

  @override
  List<Object> get props => [];
}

class FetchUpcoming extends UpcomingEvent {}

class FetchUpcomingNextPage extends UpcomingEvent {}
