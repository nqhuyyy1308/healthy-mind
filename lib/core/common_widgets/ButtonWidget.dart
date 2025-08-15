import 'package:flutter/material.dart';
import 'package:healthy_mind_application/core/constants/Constants.dart';

enum ButtonType { primary, outlined, text }

class ButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final ButtonType? type;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final ButtonStyle? buttonStyles;
  final TextStyle? textStyle;

  const ButtonWidget({
    super.key,
    required this.onPressed,
    required this.text,
    this.type,
    this.prefixIcon,
    this.suffixIcon,
    this.buttonStyles,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: type == ButtonType.text
          ? EdgeInsets.zero
          : EdgeInsets.only(top: 8),
      alignment: Alignment.center,
      child: type == ButtonType.primary
          ? ElevatedButton(
              onPressed: onPressed,
              style:
                  buttonStyles ??
                  ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                      ColorConstant.primary,
                    ),
                    foregroundColor: WidgetStateProperty.all<Color>(
                      ColorConstant.white,
                    ),
                    fixedSize: WidgetStateProperty.all<Size>(
                      Size(MediaQuery.sizeOf(context).width * 0.9, 50),
                    ),
                    textStyle: WidgetStateProperty.all<TextStyle>(
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  prefixIcon ?? SizedBox(),
                  Text(text),
                  suffixIcon ?? SizedBox(),
                ],
              ),
            )
          : type == ButtonType.outlined
          ? ElevatedButton(
              onPressed: onPressed,
              style:
                  buttonStyles ??
                  ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                      ColorConstant.white,
                    ),
                    side: WidgetStateProperty.all<BorderSide>(
                      BorderSide(color: ColorConstant.primary, width: 1),
                    ),
                    fixedSize: WidgetStateProperty.all<Size>(
                      Size(MediaQuery.sizeOf(context).width * 0.9, 50),
                    ),
                    foregroundColor: WidgetStateProperty.all<Color>(
                      ColorConstant.white,
                    ),
                    textStyle: WidgetStateProperty.all<TextStyle>(
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  prefixIcon ?? SizedBox(),
                  Text(text, style: TextStyle(color: ColorConstant.primary)),
                  suffixIcon ?? SizedBox(),
                ],
              ),
            )
          : TextButton(
              onPressed: onPressed,
              style:
                  buttonStyles ??
                  ButtonStyle(
                    textStyle: WidgetStateProperty.all<TextStyle>(
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
              child: Text(text, style: textStyle),
            ),
    );
  }
}
