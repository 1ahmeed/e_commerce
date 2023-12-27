import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key,
    required this.controller,
    this.keyboard,
    this.validate,
    this.onSubmit,
    this.onchange,
    this.onTap,
    this.label,
    this.isClickable = true,
    this.prefixIcon,
    this.suffixPressed,
    this.suffixIcon,
    this.isPassword = false,
    this.hintText,
    // this.colorBorder,
    this.colorIconPrefix,
    this.enabledBorder,
    this.focusedBorder,
    this.border,
    this.labelStyle,
    this.maxLines,
    this.hintStyle,
    this.style,
    this.colorIconSuffix,
    this.disabledBorder
  });

  final TextEditingController controller;
  final TextInputType? keyboard;
  final String? Function(String?)? validate;
  final void Function(String)? onSubmit;
  final void Function(String)? onchange;
  final void Function()? onTap;
  final String? label;
  final bool isClickable;

  final dynamic prefixIcon;
  final void Function()? suffixPressed;
  final dynamic suffixIcon;
  final bool isPassword;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? border;
  final Color? colorIconPrefix;
  final Color? colorIconSuffix;
  final String? hintText;
  final int? maxLines;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? style;
  final InputBorder? disabledBorder;
  // Color? colorBorder;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      style: style,
      controller: controller,
      keyboardType: keyboard,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onchange,
      onTap: onTap,
      // cursorColor: Colors.teal,
      validator: validate,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintStyle:hintStyle,
        hintText: hintText,
        labelStyle:labelStyle,
        enabledBorder: enabledBorder,
        // const OutlineInputBorder(
        //     borderSide: BorderSide())
        focusedBorder: focusedBorder,
        // const OutlineInputBorder(
        //     borderSide: BorderSide())
        disabledBorder: disabledBorder,
        labelText: label,
        prefixIcon: Icon(
          prefixIcon,
          color: colorIconPrefix,
        ),
        suffixIcon: IconButton(
          icon: Icon(suffixIcon,
          color:colorIconSuffix ,
          ),
          onPressed: suffixPressed,
        ),
        border: border,
      ),
    );
  }
}
