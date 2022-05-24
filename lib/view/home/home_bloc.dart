import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:phannhuhailuu_17dh110419/data/response/pizza_response.dart';
import 'package:phannhuhailuu_17dh110419/models/pizza.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState(isLoading: true)) {
    on<LoadListFoodEvent>((event, emit) async {
      final list = await PizzaRepository().readJson();

      emit(state.copyWith(listPizza: list, isLoading: false));
    });
  }
}
