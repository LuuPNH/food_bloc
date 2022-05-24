part of 'cart_bloc.dart';

class CartState extends Equatable {
  final error;
  final bool isLoading;
  final List<Cart?>? listCart;

  const CartState({this.isLoading = true, this.error, this.listCart});

  @override
  List<Object?> get props => [listCart, error, isLoading];

  CartState copyWith({
    bool? isLoading,
    var error,
    List<Cart?>? listCart,
  }) =>
      CartState(
          error: error,
          isLoading: isLoading ?? this.isLoading,
          listCart: listCart ?? this.listCart);
}
