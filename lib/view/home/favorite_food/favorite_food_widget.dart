import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:phannhuhailuu_17dh110419/utils/app_text_input.dart';
import 'package:phannhuhailuu_17dh110419/view/home/favorite_food/favorite_food_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FavoriteFoodWidget extends StatefulWidget {
  const FavoriteFoodWidget({Key? key}) : super(key: key);

  @override
  _FavoriteFoodWidgetState createState() => _FavoriteFoodWidgetState();
}

class _FavoriteFoodWidgetState extends State<FavoriteFoodWidget> {
  final TextEditingController _searchController = TextEditingController();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  Timer? debounce;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context);
    return Container(
      height: size.size.height,
      width: size.size.width * 0.65,
      padding:
          EdgeInsets.only(top: size.viewPadding.top, left: 8.0, right: 8.0),
      color: const Color(0xEAF5F5FD),
      child: Column(
        children: [
          AppTextField(
            suffixIcon: const Icon(FontAwesomeIcons.searchengin),
            hintText: 'Search',
            maxLines: 1,
            fontSize: 14.0,
            textEditingController: _searchController,
          ),
          const SizedBox(height: 20.0),
          BlocListener<FavoriteFoodBloc, FavoriteFoodState>(
            listener: (context, state) {
              if (state.error != null) {
                _refreshController.refreshCompleted();
              }
            },
            child: BlocBuilder<FavoriteFoodBloc, FavoriteFoodState>(
                builder: (context, state) {
              if (state.isLoading) {
                return const CupertinoActivityIndicator();
              } else if (state.item == null || state.item!.isEmpty) {
                return const Text(
                  'Your favorite food is empty !!',
                  style: TextStyle(fontSize: 14.0, color: Colors.black),
                );
              } else {
                return Expanded(
                    child: SmartRefresher(
                  enablePullDown: true,
                  controller: _refreshController,
                  onRefresh: _onRefresh,
                  header: CustomHeader(builder: (context, mode) {
                    if (mode == RefreshStatus.refreshing) {
                      return const CupertinoActivityIndicator();
                    } else if (mode == RefreshStatus.failed) {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(FontAwesomeIcons.bug),
                          Text('Refresh error !!',
                              style:
                                  TextStyle(fontSize: 14.0, color: Colors.red))
                        ],
                      );
                    } else {
                      return const SizedBox();
                    }
                  }),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.item!.length,
                      itemBuilder: (context, index) {
                        return SizedBox();
                      }),
                ));
              }
            }),
          ),
        ],
      ),
    );
  }

  void _onRefresh() async {
    context.read<FavoriteFoodBloc>().add(LoadFavoriteFoodEvent());
  }
}
