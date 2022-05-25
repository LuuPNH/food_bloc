import 'package:equatable/equatable.dart';
import 'package:phannhuhailuu_17dh110419/models/pizza.dart';

class Cart extends Equatable {
  final int count;
  final Pizza? item;
  final double? totalPrice;

  const Cart({this.count = 1, this.item, this.totalPrice});

  @override
  // TODO: implement props
  List<Object?> get props => [count, item, totalPrice];

  Cart copyWith({
    int? count,
    Pizza? item,
    double? totalPrice,
  }) =>
      Cart(
          count: count ?? this.count,
          item: item ?? this.item,
          totalPrice: totalPrice ?? this.totalPrice);
}
