part of 'cart_bloc.dart';

class CartState extends Equatable {
  final error;
  final bool isLoading;
  final List<Cart?>? listCart;
  final int? totalPrice;

  const CartState(
      {this.isLoading = true, this.error, this.listCart, this.totalPrice});

  @override
  List<Object?> get props => [listCart, error, isLoading, totalPrice];

  CartState copyWith({
    bool? isLoading,
    var error,
    List<Cart?>? listCart,
    int? totalPrice,
  }) =>
      CartState(
          error: error,
          isLoading: isLoading ?? this.isLoading,
          listCart: listCart ?? this.listCart,
          totalPrice: totalPrice ?? this.totalPrice);
}
