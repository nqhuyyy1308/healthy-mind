import 'package:flutter/material.dart';
import 'package:healthy_mind_application/features/intro/data/models/SliderModel.dart';

import '../../../../core/constants/Constants.dart';
import '../../../../core/routes/Navigators.dart';

class Pagination extends StatelessWidget {
  final int currentIndex;
  final PageController controller;
  final List<SliderModel> slides;

  const Pagination({
    super.key,
    required this.currentIndex,
    required this.controller,
    required this.slides,
  });

  @override
  Widget build(BuildContext context) {
    Container buildDot(int index, BuildContext context) {
      return Container(
        height: 10,
        width: currentIndex == index ? 25 : 10,
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorConstant.primary,
        ),
      );
    }

    return Container(
      margin: EdgeInsets.all(40),
      // color: ColorConstant.primary,
      child: currentIndex < slides.length - 1
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    controller.animateToPage(
                      slides.length - 1,
                      duration: Duration(seconds: 1),
                      curve: Curves.linearToEaseOut,
                    );
                  },
                  child: Text(
                    "Bỏ qua",
                    style: TextStyle(
                      color: ColorConstant.subColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    slides.length,
                    (index) => buildDot(index, context),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstant.primary,
                    foregroundColor: ColorConstant.white,
                    fixedSize: Size(48, 48),
                    padding: EdgeInsets.all(0),
                  ),
                  child: Icon(Icons.arrow_forward, size: 24),
                  onPressed: () {
                    controller.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear,
                    );
                  },
                ),
              ],
            )
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: ColorConstant.white,
                backgroundColor: ColorConstant.primary,
                fixedSize: Size(150, 48),
              ),
              child: Text(
                "Bắt đầu",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                appRouter.go('/login');
              },
            ),
    );
  }
}
