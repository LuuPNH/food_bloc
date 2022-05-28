import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final Color? backgroundColor;
  final Color? textColor;
  final Color? cursorColor;
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? fontSize;
  final FontWeight? fontWeight;
  final ValueChanged<String>? onChanged;
  final TextEditingController textEditingController;
  final Widget? suffixIcon;
  final Color? suffixIconColor;
  final String? hintText;
  final String? textError;
  final int? maxLines;
  final int? minLines;
  final bool? obscureText;
  final Color? borderColor;

  const AppTextField({
    Key? key,
    this.backgroundColor,
    this.width,
    this.height,
    this.textColor,
    this.cursorColor,
    this.borderRadius,
    this.fontSize,
    this.fontWeight,
    this.onChanged,
    required this.textEditingController,
    this.suffixIcon,
    this.suffixIconColor,
    this.hintText,
    this.textError,
    this.maxLines,
    this.minLines,
    this.obscureText,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height ?? 50.0,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(borderRadius ?? 20),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context)
                .colorScheme
                .copyWith(primary: const Color(0xFFFDBF30))),
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          style: TextStyle(
              color: textColor ?? Colors.black,
              fontWeight: fontWeight ?? FontWeight.normal,
              fontSize: fontSize ?? 16.0),
          maxLines: maxLines ?? 1,
          minLines: minLines ?? 1,
          obscureText: obscureText ?? false,
          onChanged: onChanged,
          controller: textEditingController,
          cursorColor: cursorColor ?? const Color(0xFFFDBF30),
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(borderRadius ?? 20.0)),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            labelText: hintText,
            hintStyle: TextStyle(
                color: textColor ?? Colors.grey,
                fontWeight: fontWeight ?? FontWeight.normal,
                fontSize: fontSize ?? 16.0),
            errorText: (textError == "ok" ? null : textError),
          ),
        ),
      ),
    );
  }
}
