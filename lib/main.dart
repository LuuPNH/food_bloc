import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phannhuhailuu_17dh110419/components/app_bar.dart';
import 'package:phannhuhailuu_17dh110419/view/cart/cart_bloc.dart';
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

  @override
  void didChangeDependencies() {
    blocCart = CartBloc()..add(LoadCart());
    super.didChangeDependencies();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartBloc>(
      create: (BuildContext context) => blocCart,
      child: MaterialApp(
          title: 'Flutter Exam App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const Scaffold(
            backgroundColor: Color(0xEAF5F5FD),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.0),
              child: AppBarCustoms(),
            ),
            body: HomeWidget(),
          )),
    );
  }
}
