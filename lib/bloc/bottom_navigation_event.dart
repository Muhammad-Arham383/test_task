part of 'bottom_navigation_bloc.dart';

@immutable
sealed class BottomNavigationEvent {}

class ChangeTabEvent extends BottomNavigationEvent {
  final int tabIndex;
  ChangeTabEvent(this.tabIndex);
}
