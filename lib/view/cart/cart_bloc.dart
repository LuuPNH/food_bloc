import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:phannhuhailuu_17dh110419/models/cart.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState(isLoading: true)) {
    on<LoadCart>((event, emit) {
      final List<Cart?> list = [...state.listCart ?? []];
      emit(state.copyWith(isLoading: false, listCart: list));
    });
    on<AddItemToCart>((event, emit) {
      final List<Cart?> list = [...state.listCart ?? []];
      list.add(event.item);
      emit(state.copyWith(isLoading: false, listCart: list));
    });
  }
}
