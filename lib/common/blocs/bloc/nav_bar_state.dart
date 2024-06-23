part of 'nav_bar_bloc.dart';

sealed class NavBarState extends Equatable {
  const NavBarState();

  @override
  List<Object> get props => [];
}

final class NavBarInitial extends NavBarState {}

final class NavBarChanged extends NavBarState {
  final int currentIndex;

  const NavBarChanged(this.currentIndex);

  @override
  List<Object> get props => [currentIndex];
}
