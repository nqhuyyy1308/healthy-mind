import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healthy_mind_application/core/constants/Constants.dart';

class FeatureCategory extends StatelessWidget {
  final String imgIcon;
  final String title;
  const FeatureCategory({
    super.key,
    required this.imgIcon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: ColorConstant.primary.withAlpha(50),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(imgIcon, width: 32, height: 32),
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              color: ColorConstant.fontColor,
              fontSize: FontSizeConstants.medium,
            ),
          ),
        ],
      ),
    );
  }
}
