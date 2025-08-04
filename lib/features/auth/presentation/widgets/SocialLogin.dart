import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthy_mind_application/core/common_widgets/ButtonWidget.dart';
import 'package:healthy_mind_application/core/constants/Constants.dart';

class SocialLogin extends StatelessWidget {
  SocialLogin({super.key});

  final Widget facebookIcon = SvgPicture.asset("assets/svgs/Facebook-icon.svg");
  final Widget googleIcon = SvgPicture.asset("assets/svgs/Google-icon.svg");

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Đăng ký bằng tài khoản khác",
          style: TextStyle(
            fontSize: FontSizeConstants.medium,
            fontWeight: FontWeightConstants.normal,
            color: ColorConstant.subColor,
          ),
        ),
        ButtonWidget(
          onPressed: () {},
          prefixIcon: facebookIcon,
          text: "Đăng nhập bằng Facebook",
          type: ButtonType.primary,
          buttonStyles: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(
              ColorConstant.white,
            ),
            foregroundColor: WidgetStateProperty.all<Color>(
              ColorConstant.fontColor,
            ),
            fixedSize: WidgetStateProperty.all<Size>(
              Size(MediaQuery.sizeOf(context).width * 0.9, 50),
            ),
            textStyle: WidgetStateProperty.all<TextStyle>(
              TextStyle(
                fontSize: FontSizeConstants.large,
                fontWeight: FontWeightConstants.medium,
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        ButtonWidget(
          onPressed: () {},
          prefixIcon: googleIcon,
          text: "Đăng nhập bằng Google",
          type: ButtonType.primary,
          buttonStyles: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(
              ColorConstant.white,
            ),
            foregroundColor: WidgetStateProperty.all<Color>(
              ColorConstant.fontColor,
            ),
            fixedSize: WidgetStateProperty.all<Size>(
              Size(MediaQuery.sizeOf(context).width * 0.9, 50),
            ),
            textStyle: WidgetStateProperty.all<TextStyle>(
              TextStyle(
                fontSize: FontSizeConstants.large,
                fontWeight: FontWeightConstants.medium,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
