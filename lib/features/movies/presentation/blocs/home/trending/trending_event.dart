part of 'trending_bloc.dart';

abstract class TrendingEvent extends Equatable {
  const TrendingEvent();

  @override
  List<Object> get props => [];
}

final class FetchTrending extends TrendingEvent {
  final int currentIndex;
  final int currentPage;

  const FetchTrending({this.currentIndex = 0, this.currentPage = 1});

  @override
  List<Object> get props => [currentIndex, currentPage];
}

class CarouselFetchNextPage extends TrendingEvent {}
