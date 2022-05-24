part of 'home_bloc.dart';

class HomeState extends Equatable {
  final error;
  final bool isLoading;
  final List<Pizza>? listPizza;

  const HomeState({this.isLoading = true, this.error, this.listPizza});

  @override
  List<Object?> get props => [listPizza, error];

  HomeState copyWith({
    bool? isLoading,
    var error,
    List<Pizza>? listPizza,
  }) =>
      HomeState(
          error: error,
          isLoading: isLoading ?? this.isLoading,
          listPizza: listPizza ?? this.listPizza);
}
