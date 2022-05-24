part of 'home_bloc.dart';

class HomeEvent {}

class LoadListFoodEvent extends HomeEvent {}

class LoginEventClickedEvent extends HomeEvent {
  final String? userName;
  final String? password;

  LoginEventClickedEvent(this.userName, this.password);
}
