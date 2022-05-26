import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:phannhuhailuu_17dh110419/models/pizza.dart';

part 'detail_food_event.dart';
part 'detail_food_state.dart';

class DetailFoodBloc extends Bloc<DetailFoodEvent, DetailFoodState> {
  DetailFoodBloc() : super(const DetailFoodState(isLoading: true)) {
    on<LoadListFoodEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
