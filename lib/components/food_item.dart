import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:phannhuhailuu_17dh110419/models/pizza.dart';
import 'package:phannhuhailuu_17dh110419/utils/app_string.dart';
import 'package:phannhuhailuu_17dh110419/view/home/detai_food/detail_food_widget.dart';

class FoodItem extends StatelessWidget {
  final Pizza? food;
  final Function()? onTap;

  const FoodItem(this.food, {Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailFoodWidget(
                          item: food,
                        ))),
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
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              right: -10.0,
              bottom: 0.0,
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  height: 40.0,
                  width: 60.0,
                  decoration: const BoxDecoration(
                      color: Color(0xFFADBF00),
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(10.0))),
                  child: const Icon(
                    FontAwesomeIcons.cartPlus,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
