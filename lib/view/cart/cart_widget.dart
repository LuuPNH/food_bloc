import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:phannhuhailuu_17dh110419/components/app_bar.dart';
import 'package:phannhuhailuu_17dh110419/components/cart_item.dart';
import 'package:phannhuhailuu_17dh110419/utils/app_dialog.dart';
import 'package:phannhuhailuu_17dh110419/utils/app_string.dart';
import 'package:phannhuhailuu_17dh110419/view/cart/cart_bloc.dart';
import 'package:phannhuhailuu_17dh110419/view/home/detai_food/detail_food_widget.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({Key? key}) : super(key: key);

  @override
  _CartWidgetState createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xEAF5F5FD),
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBarCustoms(
            isShowLeading: true,
          ),
        ),
        floatingActionButton:
            BlocBuilder<CartBloc, CartState>(builder: (context, state) {
          if (state.totalPrice == null || state.totalPrice == 0) {
            return const SizedBox();
          }
          return GestureDetector(
            onTap: () {
              Navigator.pop(context);
              AppDialog().showMyDialog(context);
              context.read<CartBloc>().add(CheckOutCart());
            },
            child: Container(
              height: 40.0,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: const Color(0xFFFDBF30),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    FontAwesomeIcons.calculator,
                    color: Colors.black,
                    size: 20,
                  ),
                  const SizedBox(width: 5.0),
                  Text(
                    state.totalPrice.toString() + AppStrings.usd,
                    style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        }),
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
            if (state.isLoading) {
              return const CupertinoActivityIndicator();
            } else if (state.listCart == null || state.listCart!.isEmpty) {
              return const Center(
                child: Text(
                  'Oh no, Cart emptying !! Back to chose food',
                  style: TextStyle(fontSize: 14.0, color: Colors.black),
                ),
              );
            } else {
              return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: state.listCart!.length,
                  itemBuilder: (context, index) {
                    if (state.listCart?[index]?.count != 0) {
                      return CartItem(
                        state.listCart?[index],
                        onTap: () {
                          Navigator.pushReplacement<void, void>(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailFoodWidget(
                                      id: state.listCart?[index]?.item?.id,
                                    )),
                          );
                        },
                      );
                    } else {
                      return const SizedBox();
                    }
                  });
            }
          }),
        ));
  }
}
