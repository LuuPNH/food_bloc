import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:phannhuhailuu_17dh110419/view/cart/cart_bloc.dart';

class FloatingButtonCart extends StatelessWidget {
  final Function()? onTap;

  const FloatingButtonCart({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.0,
        width: 100.0,
        decoration: BoxDecoration(
          color: const Color(0xFFFDBF30),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
          int count = 0;
          state.listCart
              ?.where((element) => element?.count != null)
              .forEach((element) {
            count += element!.count;
          });
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Badge(
                  badgeContent: Text(
                    state.listCart?.length.toString() ?? '0',
                    style: const TextStyle(
                        fontSize: 10.0,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                  ),
                  child: const Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.black,
                    size: 30.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Badge(
                  badgeContent: Text(
                    count.toString(),
                    style: const TextStyle(
                        fontSize: 10.0,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                  ),
                  child: const Icon(
                    FontAwesomeIcons.cartShopping,
                    color: Colors.black,
                    size: 30.0,
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
