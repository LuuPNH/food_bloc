import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarCustoms extends StatelessWidget {
  final String? title;
  final IconData? iconTitle;
  final IconData? subIconTitle;
  final bool isShowLeading;
  final Function()? tapOpenDrawer;

  const AppBarCustoms(
      {Key? key,
      this.title,
      this.iconTitle,
      this.subIconTitle,
      this.isShowLeading = false,
      this.tapOpenDrawer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isShowLeading
          ? IconButton(
              icon: const Icon(FontAwesomeIcons.angleLeft,
                  color: Colors.redAccent, size: 20.0),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : null,
      title: Container(
        height: 30.0,
        width: 180.0,
        decoration: BoxDecoration(
          color: const Color(0xEAEAEAFF),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconTitle ?? FontAwesomeIcons.mapLocationDot,
                color: Colors.redAccent, size: 10.0),
            const SizedBox(width: 5.0),
            Text(
              title ?? '155 Su Van Hanh, HCM',
              style: const TextStyle(fontSize: 12.0, color: Colors.black),
            ),
            const SizedBox(width: 5.0),
            Icon(
              subIconTitle ?? FontAwesomeIcons.angleDown,
              color: Colors.redAccent,
              size: 10.0,
            ),
          ],
        ),
      ),
      actions: [
        GestureDetector(
          onTap: tapOpenDrawer,
          child: Container(
            padding: const EdgeInsets.only(right: 5.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              backgroundColor: const Color(0xEAEAEAFF),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  "https://baominh.tech/wp-content/uploads/2020/09/nhan-dan-facebook.png",
                  fit: BoxFit.cover,
                  height: 30.0,
                  width: 30.0,
                ),
              ),
            ),
          ),
        ),
      ],
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  }
}
