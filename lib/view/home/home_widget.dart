import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_indicator/page_indicator.dart';
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
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state.isLoading) {
        return const CupertinoActivityIndicator();
      } else if (state.listPizza == null || state.listPizza!.isEmpty) {
        return const Text(
          'Menu empty',
          style: TextStyle(fontSize: 12.0, color: Colors.black),
        );
      } else {
        return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: state.listPizza!.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 20.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white)),
              );
            });
      }
    });
  }

  Future<void> _handleAction(BuildContext context, HomeState state) async {}
}
