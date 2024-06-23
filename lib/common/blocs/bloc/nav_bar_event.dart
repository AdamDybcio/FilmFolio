part of 'nav_bar_bloc.dart';

sealed class NavBarEvent extends Equatable {
  const NavBarEvent();

  @override
  List<Object> get props => [];
}

final class NavBarTapEvent extends NavBarEvent {
  final int index;

  const NavBarTapEvent(this.index);

  @override
  List<Object> get props => [index];
}
