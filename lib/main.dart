import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phannhuhailuu_17dh110419/components/app_bar.dart';
import 'package:phannhuhailuu_17dh110419/view/cart/cart_bloc.dart';
import 'package:phannhuhailuu_17dh110419/view/home/detai_food/detail_food_bloc.dart';
import 'package:phannhuhailuu_17dh110419/view/home/favorite_food/favorite_food_bloc.dart';
import 'package:phannhuhailuu_17dh110419/view/home/favorite_food/favorite_food_widget.dart';
import 'package:phannhuhailuu_17dh110419/view/home/home_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late CartBloc blocCart;
  late DetailFoodBloc blocDetailFood;
  late FavoriteFoodBloc blocFavoriteFood;

  final GlobalKey<ScaffoldState> globalKey = GlobalKey();

  @override
  void didChangeDependencies() {
    blocCart = CartBloc()..add(LoadCart());
    blocDetailFood = DetailFoodBloc()..add(DetailLoadListFoodEvent());
    blocFavoriteFood = FavoriteFoodBloc()..add(LoadFavoriteFoodEvent());

    super.didChangeDependencies();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartBloc>(
          create: (BuildContext context) => blocCart,
        ),
        BlocProvider<DetailFoodBloc>(
          create: (BuildContext context) => blocDetailFood,
        ),
        BlocProvider<FavoriteFoodBloc>(
          create: (BuildContext context) => blocFavoriteFood,
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Exam App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Scaffold(
            key: globalKey,
            backgroundColor: const Color(0xEAF5F5FD),
            endDrawer: const FavoriteFoodWidget(),
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(60.0),
              child: AppBarCustoms(
                tapOpenDrawer: () {
                  globalKey.currentState!.openEndDrawer();
                },
              ),
            ),
            body: const HomeWidget(),
          )),
    );
  }
}
