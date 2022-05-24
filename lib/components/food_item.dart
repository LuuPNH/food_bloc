import 'package:flutter/material.dart';
import 'package:phannhuhailuu_17dh110419/models/pizza.dart';
import 'package:phannhuhailuu_17dh110419/utils/app_string.dart';

class FoodItem extends StatelessWidget {
  final Pizza? food;

  const FoodItem(this.food, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 110,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            if (food?.img != null)
              Container(
                height: 161.0,
                width: 150.0,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: FadeInImage.assetNetwork(
                    placeholder: 'assets/gif/loading.gif',
                    image: food!.img!,
                    fit: BoxFit.cover,
                    fadeInCurve: Curves.easeIn),
              ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 10,
                  right: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      food?.name ?? '',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          'Price ${food?.price != null ? food!.price! : 0}' +
                              AppStrings.usd,
                          style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.orangeAccent),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
