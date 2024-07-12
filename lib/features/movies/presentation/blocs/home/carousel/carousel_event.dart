part of 'carousel_bloc.dart';

sealed class CarouselEvent extends Equatable {
  const CarouselEvent();

  @override
  List<Object> get props => [];
}

class ChangeCarouselMovie extends CarouselEvent {
  final int index;

  const ChangeCarouselMovie({required this.index});

  @override
  List<Object> get props => [index];
}
