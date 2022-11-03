import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:phannhuhailuu_17dh110419/data/response/pizza_response.dart';
import 'package:phannhuhailuu_17dh110419/models/pizza.dart';

part 'detail_food_event.dart';
part 'detail_food_state.dart';

class DetailFoodBloc extends Bloc<DetailFoodEvent, DetailFoodState> {
  DetailFoodBloc() : super(const DetailFoodState(isLoading: true)) {
    on<DetailLoadListFoodEvent>((event, emit) async {
      final list = await PizzaRepository().readJson();

      final item = list?.firstWhereOrNull((element) => element.id == event.id);
      if (item != null) {
        emit(state.copyWith(isLoading: false, item: item));
      } else {
        emit(state.copyWith(isLoading: false, error: 'Item Null'));
      }
    });
  }
}
