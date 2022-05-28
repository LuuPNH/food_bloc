import 'dart:convert';

import 'package:phannhuhailuu_17dh110419/data/response/pizza_response.dart';
import 'package:phannhuhailuu_17dh110419/models/pizza.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataManager {
  Future<void> saveFavoriteFood({List<dynamic>? list}) async {
    SharedPreferences localData = await SharedPreferences.getInstance();

    final saveData = jsonEncode(list);
    await localData.setString('favorite_food', saveData);
  }

  Future<List<Pizza>?> loadLocalFavoriteFood() async {
    SharedPreferences localData = await SharedPreferences.getInstance();

    final response = localData.getString('favorite_food');
    if (response != null) {
      final data = await json.decode(response);
      return PizzaResponse.fromJson(data).pizza;
    }
    return null;
  }

  Future<void> removeFavoriteFood() async {
    SharedPreferences localData = await SharedPreferences.getInstance();

    await localData.remove('favorite_food');
  }
}
