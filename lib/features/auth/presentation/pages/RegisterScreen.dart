import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_mind_application/core/common_widgets/ButtonWidget.dart';
import 'package:healthy_mind_application/core/common_widgets/HeaderWidget.dart';
import 'package:healthy_mind_application/core/common_widgets/InputWidget.dart';
import 'package:healthy_mind_application/core/constants/Constants.dart';
import 'package:healthy_mind_application/core/routes/Navigators.dart';
import 'package:healthy_mind_application/features/auth/bloc/auth_bloc.dart';
import 'package:healthy_mind_application/features/auth/bloc/auth_event.dart';
import 'package:healthy_mind_application/features/auth/bloc/auth_state.dart';
import 'package:healthy_mind_application/features/auth/presentation/widgets/SocialLogin.dart';
import 'package:healthy_mind_application/features/auth/presentation/widgets/WellcomeScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: "");
  final _passwordController = TextEditingController(text: "");

  void _handleRegister(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<AuthRegisterBloc>().add(
        RegisterEvent(
          email: _emailController.text,
          password: _passwordController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorConstant.white,
      body: SafeArea(
        child: BlocBuilder<AuthRegisterBloc, AuthRegisterState>(
          builder: (context, state) {
            final initialRegisterWidget = Column(
              children: [
                InputWidget(
                  placeholder: 'Tên',
                  type: InputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập Tên';
                    }
                    return null;
                  },
                ),
                InputWidget(
                  placeholder: 'Email',
                  type: InputType.text,
                  controller: _emailController,
                  validator: (value) {
                    String pattern =
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                    RegExp regExp = RegExp(pattern);
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập Email';
                    } else if (!regExp.hasMatch(value)) {
                      return 'Email sai định dạng';
                    }
                    return null;
                  },
                ),
                InputWidget(
                  placeholder: 'Mật khẩu',
                  type: InputType.password,
                  controller: _passwordController,
                  validator: (value) {
                    String pattern =
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                    RegExp regExp = RegExp(pattern);
                    if (value == null || value.isEmpty) {
                      // error.value = true;
                      return 'Vui lòng nhập Password';
                    } else if (!regExp.hasMatch(value)) {
                      return 'Mật khẩu cần 1 ký tự hoa, 1 ký tự thường, 1 ký tự số, 1 ký tự đặc biệt, và trên 8 ký tự';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ButtonWidget(
                  onPressed: () {
                    _handleRegister(context);
                  },
                  text: "Đăng ký",
                  type: ButtonType.primary,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Bạn đã có tài khoản?",
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorConstant.subColor,
                      ),
                    ),
                    ButtonWidget(
                      onPressed: () {
                        appRouter.go(registerScreen);
                      },
                      text: 'Đăng nhập ngay!',
                      type: ButtonType.text,
                      buttonStyles: ButtonStyle(
                        foregroundColor: WidgetStateProperty.all<Color>(
                          ColorConstant.info,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );

            final loadingRegisterWidget = Column(
              children: [
                InputWidget(
                  placeholder: 'Tên',
                  type: InputType.text,
                  enabled: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập Tên';
                    }
                    return null;
                  },
                ),
                InputWidget(
                  placeholder: 'Email',
                  type: InputType.text,
                  enabled: false,
                  controller: _emailController,
                  validator: (value) {
                    String pattern =
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                    RegExp regExp = RegExp(pattern);
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập Email';
                    } else if (!regExp.hasMatch(value)) {
                      return 'Email sai định dạng';
                    }
                    return null;
                  },
                ),
                InputWidget(
                  placeholder: 'Mật khẩu',
                  type: InputType.password,
                  enabled: false,
                  controller: _passwordController,
                  validator: (value) {
                    String pattern =
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                    RegExp regExp = RegExp(pattern);
                    if (value == null || value.isEmpty) {
                      // error.value = true;
                      return 'Vui lòng nhập Password';
                    } else if (!regExp.hasMatch(value)) {
                      return 'Mật khẩu cần 1 ký tự hoa, 1 ký tự thường, 1 ký tự số, 1 ký tự đặc biệt, và trên 8 ký tự';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ButtonWidget(
                  onPressed: () {
                    _handleRegister(context);
                  },
                  text: "Đăng ký",
                  type: ButtonType.primary,
                  suffixIcon: CircularProgressIndicator(
                    color: ColorConstant.white,
                    constraints: BoxConstraints(
                      maxWidth: 20,
                      maxHeight: 20,
                      minHeight: 20,
                      minWidth: 20,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Bạn đã có tài khoản?",
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorConstant.subColor,
                      ),
                    ),
                    ButtonWidget(
                      onPressed: () {
                        appRouter.go(registerScreen);
                      },
                      text: 'Đăng nhập ngay!',
                      type: ButtonType.text,
                      buttonStyles: ButtonStyle(
                        foregroundColor: WidgetStateProperty.all<Color>(
                          ColorConstant.info,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );

            failureRegisterWidget(errorMessage) => Column(
              children: [
                InputWidget(
                  placeholder: 'Tên',
                  type: InputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập Tên';
                    }
                    return null;
                  },
                ),
                InputWidget(
                  placeholder: 'Email',
                  type: InputType.text,
                  controller: _emailController,
                  validator: (value) {
                    String pattern =
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                    RegExp regExp = RegExp(pattern);
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập Email';
                    } else if (!regExp.hasMatch(value)) {
                      return 'Email sai định dạng';
                    }
                    return null;
                  },
                ),
                InputWidget(
                  placeholder: 'Mật khẩu',
                  type: InputType.password,
                  controller: _passwordController,
                  validator: (value) {
                    String pattern =
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                    RegExp regExp = RegExp(pattern);
                    if (value == null || value.isEmpty) {
                      // error.value = true;
                      return 'Vui lòng nhập Password';
                    } else if (!regExp.hasMatch(value)) {
                      return 'Mật khẩu cần 1 ký tự hoa, 1 ký tự thường, 1 ký tự số, 1 ký tự đặc biệt, và trên 8 ký tự';
                    }
                    return null;
                  },
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
                  child: Text(
                    errorMessage,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                      fontWeight: FontWeightConstants.medium,
                    ),
                  ),
                ),
                ButtonWidget(
                  onPressed: () {
                    _handleRegister(context);
                  },
                  text: "Đăng ký",
                  type: ButtonType.primary,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Bạn đã có tài khoản?",
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorConstant.subColor,
                      ),
                    ),
                    ButtonWidget(
                      onPressed: () {
                        appRouter.go(registerScreen);
                      },
                      text: 'Đăng nhập ngay!',
                      type: ButtonType.text,
                      buttonStyles: ButtonStyle(
                        foregroundColor: WidgetStateProperty.all<Color>(
                          ColorConstant.info,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );

            final successRegisterWidget = WellcomeScreen(
              contentType: ContentType.register,
            );

            final baseLayoutRegister = (switch (state) {
              AuthRegisterInitial() => initialRegisterWidget,
              AuthRegisterLoading() => loadingRegisterWidget,
              AuthRegisterSuccess() => successRegisterWidget,
              AuthRegisterFailure() => failureRegisterWidget(
                state.errorMessage,
              ),
            });

            return state is AuthRegisterSuccess
                ? successRegisterWidget
                : Column(
                    children: [
                      HeaderWidget(title: "Đăng ký", onBack: true),
                      SizedBox(height: 20),
                      Image.asset('assets/images/logo.png'),
                      SizedBox(height: 12),
                      Form(key: _formKey, child: baseLayoutRegister),
                      SocialLogin(),
                      SizedBox(height: 20),
                      Column(
                        children: [
                          Text("Bằng cách tiếp tục, bạn đã đồng ý với các"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ButtonWidget(
                                onPressed: () {},
                                text: "Điều khoản, Điều kiện sử dụng",
                                type: ButtonType.text,
                                buttonStyles: ButtonStyle(
                                  padding: WidgetStateProperty.all<EdgeInsets>(
                                    EdgeInsets.only(right: 4),
                                  ),
                                  foregroundColor:
                                      WidgetStateProperty.all<Color>(
                                        ColorConstant.info,
                                      ),
                                  textStyle: WidgetStateProperty.all<TextStyle>(
                                    TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              Text("của chúng tôi"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
