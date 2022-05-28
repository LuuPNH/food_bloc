part of 'favorite_food_bloc.dart';

class FavoriteFoodEvent {}

class LoadFavoriteFoodEvent extends FavoriteFoodEvent {}

class AddFavoriteFoodEvent extends FavoriteFoodEvent {
  final int? id;

  AddFavoriteFoodEvent({this.id});
}

class RemoveFavoriteFoodEvent extends FavoriteFoodEvent {
  final int? id;

  RemoveFavoriteFoodEvent({this.id});
}
