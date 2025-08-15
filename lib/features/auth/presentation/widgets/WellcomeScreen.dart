import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_mind_application/core/common_widgets/ButtonWidget.dart';
import 'package:healthy_mind_application/core/constants/Constants.dart';
import 'package:healthy_mind_application/core/routes/Navigators.dart';
import 'package:healthy_mind_application/features/auth/bloc/welcome_bloc/welcome_bloc.dart';

enum ContentType { login, register }

class WellcomeScreen extends StatelessWidget {
  const WellcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WellcomeBloc, WellcomeState>(
        builder: (context, state) {
          return SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: ColorConstant.white,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 40,
                      left: 20,
                      right: 20,
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          state.image,
                          width: 350,
                          fit: BoxFit.scaleDown,
                        ),
                        SizedBox(height: 40),
                        Text(
                          state.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: FontSizeConstants.smallTitle,
                            fontWeight: FontWeightConstants.bold,
                            color: ColorConstant.primary,
                          ),
                        ),
                        SizedBox(height: 32),
                        Text(
                          state.desc,
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
          );
        },
      ),
    );
  }
}
