import 'package:phannhuhailuu_17dh110419/models/pizza.dart';

class Cart {
  final int count;
  final Pizza item;
  final double totalPrice;

  Cart({this.count = 0, required this.item, required this.totalPrice});
}
