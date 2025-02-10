part of 'bottom_navigation_bloc.dart';

@immutable
sealed class BottomNavigationState {
  final int currentIndex;
  const BottomNavigationState(this.currentIndex);
}

class BottomNavigationInitialState extends BottomNavigationState {
  BottomNavigationInitialState() : super(0); // Default index is 0
}

class BottomNavChanged extends BottomNavigationState {
  BottomNavChanged(int index) : super(index);
}
