import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phannhuhailuu_17dh110419/components/button_add_remove.dart';
import 'package:phannhuhailuu_17dh110419/models/cart.dart';
import 'package:phannhuhailuu_17dh110419/utils/app_string.dart';
import 'package:phannhuhailuu_17dh110419/view/cart/cart_bloc.dart';

class CartItem extends StatelessWidget {
  final Cart? cartItem;
  final Function()? onTap;

  const CartItem(this.cartItem, {Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 110,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              if (cartItem?.item?.img != null)
                Container(
                  height: 161.0,
                  width: 150.0,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: FadeInImage.assetNetwork(
                      placeholder: 'assets/gif/loading.gif',
                      image: cartItem!.item!.img!,
                      fit: BoxFit.cover,
                      fadeInCurve: Curves.easeIn),
                ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        cartItem!.item!.name ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Price ${cartItem?.item?.price != null ? cartItem!.item!.price! : 0}' +
                            AppStrings.usd,
                        style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.orangeAccent),
                      ),
                      const SizedBox(height: 5),
                      ButtonAddRemove(
                        onCountAdd: () {
                          context
                              .read<CartBloc>()
                              .add(AddItemToCart(cartItem?.item));
                        },
                        count: cartItem?.count ?? 0,
                        onCountRemove: () {
                          context
                              .read<CartBloc>()
                              .add(AddItemToCart(cartItem?.item, minus: true));
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
