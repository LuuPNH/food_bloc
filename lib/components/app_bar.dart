import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarCustoms extends StatelessWidget {
  final String? title;
  final IconData? iconTitle;
  final IconData? subIconTitle;
  final bool isShowLeading;

  const AppBarCustoms(
      {Key? key,
      this.title,
      this.iconTitle,
      this.subIconTitle,
      this.isShowLeading = false})
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
        Container(
          padding: const EdgeInsets.only(right: 5.0),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            backgroundColor: const Color(0xEAEAEAFF),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(
                "https://scontent.fsgn5-8.fna.fbcdn.net/v/t39.30808-6/247469207_1844936579026451_2833597105913512429_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=730e14&_nc_ohc=FxaXepsj4I4AX-41wUf&_nc_ht=scontent.fsgn5-8.fna&oh=00_AT8ns6__8qM8ereAwlpvtPTqIth33q1hhhssJxValeFVcA&oe=629192D2",
                fit: BoxFit.cover,
                height: 30.0,
                width: 30.0,
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
