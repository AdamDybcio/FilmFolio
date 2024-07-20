part of 'details_bloc.dart';

sealed class DetailsState extends Equatable {
  const DetailsState();

  @override
  List<Object> get props => [];
}

final class DetailsInitial extends DetailsState {}

final class DetailsLoading extends DetailsState {}

final class DetailsLoaded extends DetailsState {
  final MovieDetailsModel details;
  final MoviesResultModel similar;

  const DetailsLoaded(this.details, this.similar);

  @override
  List<Object> get props => [details, similar];
}

final class DetailsError extends DetailsState {
  final String message;

  const DetailsError(this.message);

  @override
  List<Object> get props => [message];
}
