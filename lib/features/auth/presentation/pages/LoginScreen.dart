import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthy_mind_application/core/common_widgets/ButtonWidget.dart';
import 'package:healthy_mind_application/core/common_widgets/HeaderWidget.dart';
import 'package:healthy_mind_application/core/common_widgets/InputWidget.dart';
import 'package:healthy_mind_application/core/constants/Constants.dart';
import 'package:healthy_mind_application/core/routes/Navigators.dart';
import 'package:healthy_mind_application/features/auth/bloc/auth_bloc/auth_bloc.dart';
import 'package:healthy_mind_application/features/auth/bloc/welcome_bloc/welcome_bloc.dart';
import 'package:healthy_mind_application/features/auth/bloc/login_bloc/login_bloc.dart';

import 'package:healthy_mind_application/features/auth/presentation/widgets/SocialLogin.dart';
import 'package:healthy_mind_application/features/auth/presentation/widgets/WellcomeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: "");
  final _passwordController = TextEditingController(text: "");
  String? errorMessage;
  bool isLoading = false;
  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      context.read<LoginBloc>().add(
        LoginRequired(
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
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              setState(() {
                isLoading = false;
              });
              appRouter.go(wellcomeScreen, extra: WellcomeLoginState());
            } else if (state is LoginLoading) {
              setState(() {
                isLoading = true;
              });
            } else if (state is LoginFailure) {
              setState(() {
                isLoading = false;
                errorMessage = state.message;
              });
            }
          },
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                HeaderWidget(title: 'Đăng nhập'),
                SizedBox(height: 32),
                Image.asset('assets/images/logo.png'),
                SizedBox(height: 16),
                !isLoading
                    ? Column(
                        children: [
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
                          ButtonWidget(
                            onPressed: () {},
                            text: "Quên mật khẩu?",
                            type: ButtonType.text,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              errorMessage ?? "",
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
                              _handleLogin();
                            },
                            text: "Đăng nhập",
                            type: ButtonType.primary,
                          ),
                          SizedBox(height: 8),
                        ],
                      )
                    : Column(
                        children: [
                          InputWidget(
                            placeholder: 'Email',
                            type: InputType.text,
                            controller: _emailController,
                            enabled: false,
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
                            enabled: false,
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
                          ButtonWidget(
                            onPressed: () {},
                            text: "Quên mật khẩu?",
                            type: ButtonType.text,
                          ),
                          SizedBox(height: 16),
                          ButtonWidget(
                            onPressed: () {
                              _handleLogin();
                            },
                            text: "Đăng nhập",
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
                          SizedBox(height: 8),
                        ],
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Bạn chưa tạo tài khoản?",
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorConstant.subColor,
                      ),
                    ),
                    ButtonWidget(
                      onPressed: () {
                        appRouter.go(registerScreen);
                      },
                      text: 'Đăng ký ngay!',
                      type: ButtonType.text,
                      buttonStyles: ButtonStyle(
                        foregroundColor: WidgetStateProperty.all<Color>(
                          ColorConstant.info,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                SocialLogin(),
              ],
            ),
          ),
        ),
        // final initLoginWidget = Column(
        //   children: [
        //     InputWidget(
        //       placeholder: 'Email',
        //       type: InputType.text,
        //       controller: _emailController,
        //       validator: (value) {
        //         String pattern =
        //             r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
        //         RegExp regExp = RegExp(pattern);
        //         if (value == null || value.isEmpty) {
        //           return 'Vui lòng nhập Email';
        //         } else if (!regExp.hasMatch(value)) {
        //           return 'Email sai định dạng';
        //         }
        //         return null;
        //       },
        //     ),
        //     InputWidget(
        //       placeholder: 'Mật khẩu',
        //       type: InputType.password,
        //       controller: _passwordController,
        //       validator: (value) {
        //         String pattern =
        //             r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
        //         RegExp regExp = RegExp(pattern);
        //         if (value == null || value.isEmpty) {
        //           // error.value = true;
        //           return 'Vui lòng nhập Password';
        //         } else if (!regExp.hasMatch(value)) {
        //           return 'Mật khẩu cần 1 ký tự hoa, 1 ký tự thường, 1 ký tự số, 1 ký tự đặc biệt, và trên 8 ký tự';
        //         }
        //         return null;
        //       },
        //     ),
        //     ButtonWidget(
        //       onPressed: () {},
        //       text: "Quên mật khẩu?",
        //       type: ButtonType.text,
        //     ),
        //     SizedBox(height: 16),
        //     ButtonWidget(
        //       onPressed: () {
        //         _handleLogin(context);
        //       },
        //       text: "Đăng nhập",
        //       type: ButtonType.primary,
        //     ),
        //     SizedBox(height: 8),
        //   ],
        // );

        // final loadingLoginWidget = Column(
        //   children: [
        //     InputWidget(
        //       placeholder: 'Email',
        //       type: InputType.text,
        //       controller: _emailController,
        //       enabled: false,
        //       validator: (value) {
        //         String pattern =
        //             r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
        //         RegExp regExp = RegExp(pattern);
        //         if (value == null || value.isEmpty) {
        //           return 'Vui lòng nhập Email';
        //         } else if (!regExp.hasMatch(value)) {
        //           return 'Email sai định dạng';
        //         }
        //         return null;
        //       },
        //     ),
        //     InputWidget(
        //       placeholder: 'Mật khẩu',
        //       type: InputType.password,
        //       controller: _passwordController,
        //       enabled: false,
        //       validator: (value) {
        //         String pattern =
        //             r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
        //         RegExp regExp = RegExp(pattern);
        //         if (value == null || value.isEmpty) {
        //           // error.value = true;
        //           return 'Vui lòng nhập Password';
        //         } else if (!regExp.hasMatch(value)) {
        //           return 'Mật khẩu cần 1 ký tự hoa, 1 ký tự thường, 1 ký tự số, 1 ký tự đặc biệt, và trên 8 ký tự';
        //         }
        //         return null;
        //       },
        //     ),
        //     ButtonWidget(
        //       onPressed: () {},
        //       text: "Quên mật khẩu?",
        //       type: ButtonType.text,
        //     ),
        //     SizedBox(height: 16),
        //     ButtonWidget(
        //       onPressed: () {
        //         _handleLogin(context);
        //       },
        //       text: "Đăng nhập",
        //       type: ButtonType.primary,
        //       suffixIcon: CircularProgressIndicator(
        //         color: ColorConstant.white,
        //         constraints: BoxConstraints(
        //           maxWidth: 20,
        //           maxHeight: 20,
        //           minHeight: 20,
        //           minWidth: 20,
        //         ),
        //       ),
        //     ),
        //     SizedBox(height: 8),
        //   ],
        // );

        // failureLoginWidget(message) => Column(
        //   children: [
        //     InputWidget(
        //       placeholder: 'Email',
        //       type: InputType.text,
        //       controller: _emailController,
        //       validator: (value) {
        //         String pattern =
        //             r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
        //         RegExp regExp = RegExp(pattern);
        //         if (value == null || value.isEmpty) {
        //           return 'Vui lòng nhập Email';
        //         } else if (!regExp.hasMatch(value)) {
        //           return 'Email sai định dạng';
        //         }
        //         return null;
        //       },
        //     ),
        //     InputWidget(
        //       placeholder: 'Mật khẩu',
        //       type: InputType.password,
        //       controller: _passwordController,
        //       validator: (value) {
        //         String pattern =
        //             r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
        //         RegExp regExp = RegExp(pattern);
        //         if (value == null || value.isEmpty) {
        //           // error.value = true;
        //           return 'Vui lòng nhập Password';
        //         } else if (!regExp.hasMatch(value)) {
        //           return 'Mật khẩu cần 1 ký tự hoa, 1 ký tự thường, 1 ký tự số, 1 ký tự đặc biệt, và trên 8 ký tự';
        //         }
        //         return null;
        //       },
        //     ),
        //     ButtonWidget(
        //       onPressed: () {},
        //       text: "Quên mật khẩu?",
        //       type: ButtonType.text,
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Text(
        //         message,
        //         textAlign: TextAlign.center,
        //         style: TextStyle(
        //           color: Colors.red,
        //           fontSize: 14,
        //           fontWeight: FontWeightConstants.medium,
        //         ),
        //       ),
        //     ),
        //     ButtonWidget(
        //       onPressed: () {
        //         _handleLogin(context);
        //       },
        //       text: "Đăng nhập",
        //       type: ButtonType.primary,
        //     ),
        //     SizedBox(height: 8),
        //   ],
        // );

        // final successLoginWidget = WellcomeScreen(
        //   contentType: ContentType.login,
        // );

        // final baseLayoutLogin = (switch (state) {
        //   LoginInitial() => initLoginWidget,
        //   LoginLoading() => loadingLoginWidget,
        //   LoginSuccess() => successLoginWidget,
        //   LoginFailure() => failureLoginWidget(state.message),

        //   _ => throw Exception('Unhandled state: $state'),
        // });

        //   return state is LoginSuccess
        //       ? successLoginWidget
        //       : Form(
        //           key: _formKey,
        //           child: Column(
        //             children: [
        //               HeaderWidget(title: 'Đăng nhập'),
        //               SizedBox(height: 32),
        //               Image.asset('assets/images/logo.png'),
        //               SizedBox(height: 16),
        //               Container(child: baseLayoutLogin),
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: [
        //                   Text(
        //                     "Bạn chưa tạo tài khoản?",
        //                     style: TextStyle(
        //                       fontSize: 14,
        //                       color: ColorConstant.subColor,
        //                     ),
        //                   ),
        //                   ButtonWidget(
        //                     onPressed: () {
        //                       appRouter.go(registerScreen);
        //                     },
        //                     text: 'Đăng ký ngay!',
        //                     type: ButtonType.text,
        //                     buttonStyles: ButtonStyle(
        //                       foregroundColor: WidgetStateProperty.all<Color>(
        //                         ColorConstant.info,
        //                       ),
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //               SizedBox(height: 40),
        //               SocialLogin(),
        //             ],
        //           ),
        //         );
        // },
      ),
    );
  }
}
