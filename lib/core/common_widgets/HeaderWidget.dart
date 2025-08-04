import 'package:flutter/material.dart';
import 'package:healthy_mind_application/core/constants/Constants.dart';
import 'package:healthy_mind_application/core/routes/Navigators.dart';

class HeaderWidget extends StatelessWidget {
  final bool? onBack;
  final String title;
  final Widget? rightBtn;
  const HeaderWidget({
    super.key,
    required this.title,
    this.onBack,
    this.rightBtn,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          onBack == true
              ? IconButton(
                  onPressed: () {
                    appRouter.pop();
                  },
                  icon: Icon(Icons.arrow_back),
                )
              : SizedBox(width: 40),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: ColorConstant.fontColor,
            ),
          ),
          rightBtn ?? SizedBox(width: 40),
        ],
      ),
    );
  }
}
