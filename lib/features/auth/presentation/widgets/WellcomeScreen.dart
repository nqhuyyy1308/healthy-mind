import 'package:flutter/material.dart';
import 'package:healthy_mind_application/core/common_widgets/ButtonWidget.dart';
import 'package:healthy_mind_application/core/constants/Constants.dart';
import 'package:healthy_mind_application/core/routes/Navigators.dart';

enum ContentType { login, register }

class WellcomeScreen extends StatelessWidget {
  final ContentType contentType;
  const WellcomeScreen({super.key, required this.contentType});

  _getImg() {
    switch (contentType) {
      case ContentType.login:
        return "assets/images/wellcome-screen-2.png";
      case ContentType.register:
        return "assets/images/wellcome-screen.png";
    }
  }

  _getTitle() {
    switch (contentType) {
      case ContentType.login:
        return "Bạn đã đăng nhập thành công!";
      case ContentType.register:
        return "Bạn đã đăng ký thành công!";
    }
  }

  _getDesc() {
    switch (contentType) {
      case ContentType.login:
        return "Cập nhật thông tin cá nhân để nhận được những gợi ý chăm sóc sức khỏe tinh thần phù hợp với mong muốn và lối sống của bạn!";
      case ContentType.register:
        return "Ngay bây giờ bạn có thể dễ dàng đặt lịch hẹn với chuyên gia tâm lý và quản lý hồ sơ tư vấn của mình và người thân.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: ColorConstant.white,
              child: Padding(
                padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                child: Column(
                  children: [
                    Image.asset(_getImg(), width: 350, fit: BoxFit.scaleDown),
                    SizedBox(height: 40),
                    Text(
                      _getTitle(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: FontSizeConstants.smallTitle,
                        fontWeight: FontWeightConstants.bold,
                        color: ColorConstant.primary,
                      ),
                    ),
                    SizedBox(height: 32),
                    Text(
                      _getDesc(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: FontSizeConstants.large,
                        fontWeight: FontWeightConstants.normal,
                        color: ColorConstant.subColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ButtonWidget(
              onPressed: () {
                appRouter.go(homeScreen);
              },
              text: "Bắt đầu",
              type: ButtonType.primary,
            ),
          ],
        ),
      ),
    );
  }
}
