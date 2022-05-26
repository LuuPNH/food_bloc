part of 'detail_food_bloc.dart';

class DetailFoodState extends Equatable {
  final error;
  final bool isLoading;
  final Pizza? item;

  const DetailFoodState({this.isLoading = true, this.error, this.item});

  @override
  List<Object?> get props => [item, error];

  DetailFoodState copyWith({
    bool? isLoading,
    var error,
    Pizza? item,
  }) =>
      DetailFoodState(
          error: error,
          isLoading: isLoading ?? this.isLoading,
          item: item ?? this.item);
}
