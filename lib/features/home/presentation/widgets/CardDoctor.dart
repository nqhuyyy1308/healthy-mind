import 'package:flutter/material.dart';
import 'package:healthy_mind_application/core/constants/Constants.dart';

class CardDoctor extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String jobTitle;
  const CardDoctor({
    super.key,
    required this.imgUrl,
    required this.name,
    required this.jobTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstant.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: ColorConstant.ccc,
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        spacing: 8,
        children: [
          Image.asset(imgUrl, width: 200, fit: BoxFit.fitWidth),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
            child: Column(
              spacing: 4,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeightConstants.bold,
                    fontSize: FontSizeConstants.large,
                  ),
                ),
                Text(
                  jobTitle,
                  style: TextStyle(
                    color: ColorConstant.subColor,
                    fontWeight: FontWeightConstants.normal,
                    fontSize: FontSizeConstants.medium,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
