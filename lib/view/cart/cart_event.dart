part of 'cart_bloc.dart';

class CartEvent {}

class LoadCart extends CartEvent {}

class AddItemToCart extends CartEvent {
  final Pizza? item;
  final bool minus;

  AddItemToCart(this.item, {this.minus = false});
}

class CheckOutCart extends CartEvent {}
