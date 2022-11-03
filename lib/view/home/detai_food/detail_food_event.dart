part of 'detail_food_bloc.dart';

class DetailFoodEvent {}

class DetailLoadListFoodEvent extends DetailFoodEvent {
  final int? id;

  DetailLoadListFoodEvent({this.id});
}
