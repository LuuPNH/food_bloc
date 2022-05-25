import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:phannhuhailuu_17dh110419/components/food_item.dart';
import 'package:phannhuhailuu_17dh110419/view/cart/cart_bloc.dart';
import 'package:phannhuhailuu_17dh110419/view/cart/cart_widget.dart';
import 'package:phannhuhailuu_17dh110419/view/destination_carousel/destination_arousel.dart';
import 'package:phannhuhailuu_17dh110419/view/home/home_bloc.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late PageController controller;

  GlobalKey<PageContainerState> key = GlobalKey();

  late HomeBloc bloc;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void didChangeDependencies() {
    bloc = HomeBloc()..add(LoadListFoodEvent());
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
            create: (BuildContext context) => bloc,
          ),
        ],
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: _handleAction,
          builder: _buildBody,
        ));
  }

  Widget _buildBody(BuildContext context, HomeState state) {
    return Scaffold(
      backgroundColor: const Color(0xEAEAEAFF),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CartWidget()));
          },
          backgroundColor: const Color(0xFFFDBF30),
          elevation: 2,
          child: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
            return Badge(
              badgeContent: Text(state.listCart?.length.toString() ?? '0'),
              child: const Icon(
                Icons.shopping_bag_outlined,
                color: Colors.black,
                size: 30,
              ),
            );
          })),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const DestinationCarousel(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 30.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Center(
                  child: Text(
                    'Menu to day here',
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
              if (state.isLoading) {
                return const CupertinoActivityIndicator();
              } else if (state.listPizza == null || state.listPizza!.isEmpty) {
                return const Text(
                  'To day, Restaurant off !!',
                  style: TextStyle(fontSize: 14.0, color: Colors.black),
                );
              } else {
                return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: state.listPizza!.length,
                    itemBuilder: (context, index) {
                      return FoodItem(
                        state.listPizza?[index],
                        onTap: () {
                          context
                              .read<CartBloc>()
                              .add(AddItemToCart(state.listPizza?[index]));
                        },
                      );
                    });
              }
            })
          ],
        ),
      ),
    );
  }

  Future<void> _handleAction(BuildContext context, HomeState state) async {}
}
