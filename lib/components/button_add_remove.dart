import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonAddRemove extends StatelessWidget {
  final int count;
  final VoidCallback? onCountAdd;
  final VoidCallback? onCountRemove;

  const ButtonAddRemove(
      {Key? key, this.count = 0, this.onCountAdd, this.onCountRemove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: const Color(0xEADBDBDB)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onCountRemove,
            child: const Icon(
              FontAwesomeIcons.minus,
              color: Colors.black,
              size: 15,
            ),
          ),
          const SizedBox(width: 8.0),
          Container(
            width: 30.0,
            height: 20.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0), color: Colors.white),
            child: Text(
              count.toString(),
              style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          const SizedBox(width: 8.0),
          GestureDetector(
            onTap: onCountAdd,
            child: const Icon(
              FontAwesomeIcons.plus,
              color: Colors.black,
              size: 15,
            ),
          )
        ],
      ),
    );
  }
}
