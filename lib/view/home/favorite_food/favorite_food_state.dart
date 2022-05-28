part of 'favorite_food_bloc.dart';

class FavoriteFoodState extends Equatable {
  final error;
  final bool isLoading;
  final List<Pizza?>? item;

  const FavoriteFoodState({this.isLoading = true, this.error, this.item});

  @override
  List<Object?> get props => [item, error];

  FavoriteFoodState copyWith({
    bool? isLoading,
    var error,
    List<Pizza?>? item,
  }) =>
      FavoriteFoodState(
          error: error,
          isLoading: isLoading ?? this.isLoading,
          item: item ?? this.item);
}
