import 'package:flutter/material.dart';
import 'package:flutter_learning/shared/styles/icon_broken.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget CustomTextFormField({
  required TextEditingController controller,
  bool obscureText = false,
  ValueChanged<String>? onSubmitted,
  required FormFieldValidator<String> validator,
  ValueChanged<String>? onChanged,
  Widget? suffixIcon,
  Widget? prefixIcon,
  required String label,
  String? hintText,
  required TextInputType keyboardType,
}) =>
    TextFormField(
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      onFieldSubmitted: onSubmitted,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        isDense: true,
        disabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        errorBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        focusedErrorBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        hintText: hintText,
      ),
    );

Widget CustomButton({
  required VoidCallback onPressed,
  required Widget child,
  ShapeBorder? shape,
  double? elevation,
  double height = 40,
  double? width,
  Color? hoverColor,
  Color? color,
  Color? textColor,
}) =>
    MaterialButton(
      elevation: elevation,
      height: height,
      minWidth: width,
      shape: shape,
      hoverColor: hoverColor,
      color: color,
      textColor: textColor,
      onPressed: onPressed,
      child: child,
    );

Widget CustomTextButton(String text, VoidCallback? onPressed) =>
    TextButton(onPressed: onPressed, child: Text(text));

void navigateAndFinish(context, Widget widget) =>
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return widget;
    }));

void navigateWithoutBack(context, Widget widget) =>
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return widget;
    }), (route) => false);

void navigateTo(context, Widget widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return widget;
    }));

void showToast({
  required String text,
  required ToastStates state,
}) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0);
}

enum ToastStates { SUCCESS, ERROR, WARNING }

PreferredSizeWidget DefaultAppBar(
        {required BuildContext context,
        String? title,
        List<Widget>? actions}) =>
    AppBar(
      title: Text(title!),
      titleSpacing: 0.0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(IconBroken.arrowLeft_2),
      ),
      actions: actions,
    );

Color? chooseToastColor(ToastStates state) {
  Color? color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

Widget myDivider() => Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey[300],
    );
