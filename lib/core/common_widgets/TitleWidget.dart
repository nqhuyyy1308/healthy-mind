import 'package:flutter/material.dart';
import 'package:healthy_mind_application/core/common_widgets/ButtonWidget.dart';
import 'package:healthy_mind_application/core/constants/Constants.dart';

class TitleWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final FontWeight? subTitleFontWeight, titleFontWeight;
  final Color? subTitleColor, titleColor;
  final String title;
  final String? subTitle;
  final double? titleSize, subTitleSize;
  final bool? subButton;
  final EdgeInsetsGeometry? margin;

  const TitleWidget({
    super.key,
    this.onPressed,
    this.subTitleFontWeight,
    this.titleFontWeight,
    this.titleColor,
    required this.title,
    this.subTitle,
    this.titleSize,
    this.subTitleSize,
    this.subButton,
    this.margin,
    this.subTitleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.only(top: 16, bottom: 16),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: titleSize ?? FontSizeConstants.smallTitle,
              fontWeight: titleFontWeight ?? FontWeightConstants.semiBold,
            ),
          ),
          subButton == true
              ? ButtonWidget(
                  onPressed: onPressed,
                  text: subTitle ?? "",
                  type: ButtonType.text,
                  textStyle: TextStyle(
                    fontSize: subTitleSize,
                    fontWeight: subTitleFontWeight,
                    color: subTitleColor,
                  ),
                )
              : Text(
                  subTitle ?? "",
                  style: TextStyle(
                    fontSize: subTitleSize,
                    fontWeight: subTitleFontWeight,
                    color: subTitleColor,
                  ),
                ),
        ],
      ),
    );
  }
}
