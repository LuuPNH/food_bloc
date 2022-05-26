import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:phannhuhailuu_17dh110419/components/button_add_remove.dart';
import 'package:phannhuhailuu_17dh110419/components/floating_button_cart.dart';
import 'package:phannhuhailuu_17dh110419/utils/app_string.dart';
import 'package:phannhuhailuu_17dh110419/view/cart/cart_bloc.dart';
import 'package:phannhuhailuu_17dh110419/view/cart/cart_widget.dart';
import 'package:phannhuhailuu_17dh110419/view/home/detai_food/detail_food_bloc.dart';

class DetailFoodWidget extends StatefulWidget {
  final int? id;

  const DetailFoodWidget({Key? key, this.id}) : super(key: key);

  @override
  State<DetailFoodWidget> createState() => _DetailFoodWidgetState();
}

class _DetailFoodWidgetState extends State<DetailFoodWidget> {
  @override
  void didChangeDependencies() {
    context.read<DetailFoodBloc>().add(DetailLoadListFoodEvent(id: widget.id));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailFoodBloc, DetailFoodState>(
      listener: _handleAction,
      builder: _buildBody,
    );
  }

  Widget _buildBody(BuildContext context, DetailFoodState state) {
    return Scaffold(
      floatingActionButton: FloatingButtonCart(
        onTap: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const CartWidget()));
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
                left: 25,
                right: 25,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Container(
                        color: Colors.white,
                        child: const Icon(
                          Icons.arrow_back_ios_outlined,
                          color: Colors.black,
                        )),
                    onPressed: () => Navigator.pop(context),
                  ),
                  IconButton(
                    icon: Container(
                        color: Colors.white,
                        child: const Icon(
                          Icons.favorite_outline,
                          color: Colors.black,
                        )),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            BlocBuilder<DetailFoodBloc, DetailFoodState>(
                builder: (context, state) {
              if (state.isLoading) {
                return const CupertinoActivityIndicator();
              } else if (state.item == null) {
                return const Text(
                  'Sorry! We have a error here! ',
                  style: TextStyle(fontSize: 14.0, color: Colors.black),
                );
              } else {
                return Column(
                  children: [
                    _buildImageDetailFood(state),
                    Container(
                      padding: const EdgeInsets.all(25),
                      color: const Color(0xFFFDBF30),
                      child: Column(
                        children: [
                          Text(
                            state.item?.name ?? 'No name',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildIconText(
                                  Icons.access_time_outlined, Colors.blue,
                                  text: '20 min'),
                              _buildIconText(FontAwesomeIcons.moneyCheckDollar,
                                  Colors.green,
                                  text: state.item?.price.toString() != null
                                      ? (state.item!.price.toString() +
                                          AppStrings.usd)
                                      : null),
                            ],
                          ),
                          const SizedBox(height: 30),
                          BlocBuilder<CartBloc, CartState>(
                              builder: (context, state) {
                            final count = state.listCart
                                ?.firstWhereOrNull(
                                    (element) => element?.item?.id == widget.id)
                                ?.count;
                            return ButtonAddRemove(
                              count: count,
                              onCountAdd: () {
                                context.read<CartBloc>().add(AddItemToCart(
                                    context.read<DetailFoodBloc>().state.item));
                              },
                              onCountRemove: () {
                                if (count != null && count != 0) {
                                  context.read<CartBloc>().add(AddItemToCart(
                                      context.read<DetailFoodBloc>().state.item,
                                      minus: true));
                                }
                              },
                            );
                          }),
                          const SizedBox(height: 30),
                          Row(
                            children: const [
                              Text(
                                'Description',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            state.item?.description ?? '',
                            style: const TextStyle(
                              wordSpacing: 1.2,
                              height: 1.5,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                );
              }
            }),
          ],
        ),
      ),
    );
  }

  Future<void> _handleAction(
      BuildContext context, DetailFoodState state) async {}

  Widget _buildImageDetailFood(DetailFoodState state) {
    return SizedBox(
      height: 250,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                      color: Color(0xFFFDBF30),
                    ),
                  ))
            ],
          ),
          if (state.item?.img != null)
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: const EdgeInsets.all(15),
                width: 250,
                height: 250,
                child: ClipOval(
                  child: FadeInImage.assetNetwork(
                      placeholder: 'assets/gif/loading.gif',
                      image: state.item!.img!,
                      fit: BoxFit.cover,
                      fadeInCurve: Curves.easeIn),
                ),
              ),
            )
        ],
      ),
    );
  }

  Widget _buildIconText(IconData icon, Color color, {String? text}) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
          size: 20,
        ),
        const SizedBox(width: 10.0),
        if (text != null)
          Text(
            text,
            style: const TextStyle(fontSize: 16),
          )
      ],
    );
  }
}
