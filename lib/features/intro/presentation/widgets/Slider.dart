import 'package:flutter/material.dart';
import '../../../../core/constants/Constants.dart';

class Carousel extends StatelessWidget {
  final String? image;
  final String? title;
  final String? description;

  Carousel({super.key, this.image, this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image!, width: 300, height: 300),
          SizedBox(height: 40),
          Text(
            title!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: ColorConstant.primary,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsetsGeometry.only(left: 40, right: 40),
            child: Text(
              description!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: ColorConstant.subColor,
              ),
            ),
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}
