import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:phannhuhailuu_17dh110419/models/pizza.dart';

class PizzaResponse {
  final List<Pizza>? pizza;

  PizzaResponse(this.pizza);

  PizzaResponse.fromJson(List<dynamic> json)
      : pizza = (json).map((i) => Pizza.fromJson(i)).toList();
}

class PizzaRepository {
  Future<List<Pizza>?> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/pizza_data.json');
    final data = await json.decode(response);
    return PizzaResponse.fromJson(data).pizza;
  }
}
