import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:phannhuhailuu_17dh110419/models/cart.dart';
import 'package:phannhuhailuu_17dh110419/models/pizza.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState(isLoading: true)) {
    on<LoadCart>((event, emit) {
      final List<Cart?> list = [...state.listCart ?? []];
      emit(state.copyWith(
          isLoading: false, listCart: list, totalPrice: totalPrice(list)));
    });
    on<AddItemToCart>((event, emit) {
      final List<Cart?> list = [...state.listCart ?? []];

      final hasItem =
          list.indexWhere((item) => item?.item?.id == event.item?.id);

      if (hasItem != -1) {
        final updateItem = Cart(
          count: event.minus
              ? (state.listCart![hasItem]?.count ?? 0) - 1
              : (state.listCart![hasItem]?.count ?? 0) + 1,
          item: event.item,
        );

        list.removeAt(hasItem);
        if (updateItem.count != 0) {
          list.insert(hasItem, updateItem);
        }
        emit(state.copyWith(
            isLoading: false, listCart: list, totalPrice: totalPrice(list)));
      } else {
        final updateItem = Cart(
          item: event.item,
        );
        list.add(updateItem);
        emit(state.copyWith(
            isLoading: false, listCart: list, totalPrice: totalPrice(list)));
      }
    });
    on<CheckOutCart>((event, emit) {
      emit(const CartState(isLoading: false));
    });
  }

  int totalPrice(List<Cart?>? list) {
    int price = 0;
    if (list == null || list.isEmpty) {
      return price;
    } else {
      list.where((element) => element?.item?.price != null).forEach((element) {
        price += element!.item!.price! * element.count;
      });
      return price;
    }
  }
}
