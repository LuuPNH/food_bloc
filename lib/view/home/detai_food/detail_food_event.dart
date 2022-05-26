part of 'detail_food_bloc.dart';

class DetailFoodEvent {}

class LoadListFoodEvent extends DetailFoodEvent {
  final Pizza? item;

  LoadListFoodEvent({this.item});
}
