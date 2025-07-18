import 'package:flutter/material.dart';
import 'package:healthy_mind_application/core/constants/Constants.dart';

enum InputType { text, password, phone }

class InputWidget extends StatefulWidget {
  final String placeholder;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final InputDecoration? inputStyle;
  final InputType? type;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool? enabled;

  const InputWidget({
    super.key,
    required this.placeholder,
    this.suffixIcon,
    this.prefixIcon,
    this.inputStyle,
    this.type,
    this.controller,
    this.validator,
    this.enabled,
  });

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  bool isShow = true;
  // TextEditingController controller = TextEditingController();

  // final ValueNotifier<bool> error = useState(false);

  void onShowPass() {
    setState(() {
      isShow = !isShow;
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   controller = TextEditingController();

  //   controller.addListener(() {
  //     setState(() {});
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: MediaQuery.sizeOf(context).width * 0.9,
      alignment: Alignment.center,
      child: Material(
        elevation: 2,
        shadowColor: ColorConstant.ccc,
        borderRadius: BorderRadius.circular(12),
        child: TextFormField(
          // validator: (value) {
          //   String pattern =
          //       r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
          //   RegExp regExp = RegExp(pattern);
          //   if (required) {
          //     if (value == null || value.isEmpty) {
          //       // error.value = true;
          //       return 'Vui lòng nhập ${widget.placeholder}';
          //     } else if (!regExp.hasMatch(value)) {
          //       return 'Mật khẩu cần 1 ký tự hoa, 1 ký tự thường, 1 ký tự số, 1 ký tự đặc biệt, và trên 8 ký tự';
          //     }
          //   }
          //   return null;
          // },
          controller: widget.controller,
          validator: widget.validator,
          obscureText: widget.type == InputType.password ? isShow : false,
          keyboardType: widget.type == InputType.phone
              ? TextInputType.phone
              : TextInputType.text,
          enabled: widget.enabled,
          decoration:
              widget.inputStyle ??
              InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: ColorConstant.primaryLight,
                    width: 1,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: ColorConstant.primaryLight,
                    width: 1,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: ColorConstant.error, width: 1),
                ),
                errorStyle: TextStyle(fontSize: 14),
                hintText: widget.placeholder,
                prefixIcon: widget.prefixIcon,
                suffixIcon:
                    widget.suffixIcon ??
                    (widget.type == InputType.password
                        ? IconButton(
                            onPressed: () => {onShowPass()},
                            icon: isShow == true
                                ? Icon(Icons.visibility_off, size: 20)
                                : Icon(Icons.visibility, size: 20),
                          )
                        : null),
                // : (controller.text.isEmpty
                //       ? null
                //       : IconButton(
                //           onPressed: () {
                //             controller.clear();
                //           },
                //           icon: Icon(Icons.clear),
                //         ))),
                fillColor: Colors.white,
                filled: true,
              ),
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
        ),
      ),
    );
  }
}
