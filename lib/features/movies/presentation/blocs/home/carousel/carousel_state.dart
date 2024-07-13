part of 'carousel_bloc.dart';

sealed class CarouselState extends Equatable {
  const CarouselState();

  @override
  List<Object> get props => [];
}

final class CarouselChanged extends CarouselState {
  final int index;

  const CarouselChanged(this.index);

  @override
  List<Object> get props => [index];
}
