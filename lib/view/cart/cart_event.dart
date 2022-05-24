part of 'cart_bloc.dart';

class CartEvent {}

class LoadCart extends CartEvent {}

class AddItemToCart extends CartEvent {
  final Cart? item;

  AddItemToCart(this.item);
}
