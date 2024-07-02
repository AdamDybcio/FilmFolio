part of 'movie_carousel_bloc.dart';

abstract class MovieCarouselEvent extends Equatable {
  const MovieCarouselEvent();

  @override
  List<Object> get props => [];
}

final class CarouselLoadEvent extends MovieCarouselEvent {
  final int currentIndex;
  final int currentPage;

  const CarouselLoadEvent({this.currentIndex = 0, this.currentPage = 1});

  @override
  List<Object> get props => [currentIndex, currentPage];
}

class CarouselFetchNextPage extends MovieCarouselEvent {}
