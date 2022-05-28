import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:phannhuhailuu_17dh110419/data/local_data_manager/local_data_manager.dart';
import 'package:phannhuhailuu_17dh110419/data/response/pizza_response.dart';
import 'package:phannhuhailuu_17dh110419/models/pizza.dart';

part 'favorite_food_event.dart';
part 'favorite_food_state.dart';

class FavoriteFoodBloc extends Bloc<FavoriteFoodEvent, FavoriteFoodState> {
  FavoriteFoodBloc() : super(const FavoriteFoodState(isLoading: true)) {
    on<LoadFavoriteFoodEvent>((event, emit) async {
      final list = await LocalDataManager().loadLocalFavoriteFood();
      emit(state.copyWith(isLoading: false, item: list));
    });
    on<AddFavoriteFoodEvent>((event, emit) async {
      final listFavorite = await LocalDataManager().loadLocalFavoriteFood();
      final listItem = await PizzaRepository().readJson();

      final itemCheck =
          listFavorite?.firstWhereOrNull((element) => element.id == event.id);
      final itemFinding =
          listItem?.firstWhereOrNull((element) => element.id == event.id);

      if (itemCheck == null && itemFinding != null) {
        listFavorite?.add(itemFinding);
        print(listFavorite);
        await LocalDataManager().removeFavoriteFood();
        await LocalDataManager().saveFavoriteFood(list: listFavorite);
        emit(state.copyWith(isLoading: false, item: listFavorite));
      } else {
        emit(state.copyWith(
            isLoading: false, error: 'Item had in list Favorite'));
      }
    });
  }
}
