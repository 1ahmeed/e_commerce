import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key,
    required this.controller,
    required this.keyboard,
    required this.validate,
    this.onSubmit,
    this.onchange,
    this.onTap,
     this.label,
    this.isClickable = true,
     this.prefixIcon,
    this.suffixPressed,
    this.suffixIcon,
    this.isPassword = false,
    // this.colorBorder,
    this.colorIcon,
    this.enabledBorder,
    this.focusedBorder,
    this.border,
    this.hintText,
    this.maxLines
  });

  final TextEditingController controller;
  final TextInputType keyboard;
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
  final Color? colorIcon;
  final String? hintText;
  final int? maxLines;

  // Color? colorBorder;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboard,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onchange,
      onTap: onTap,
      // cursorColor: Colors.teal,
      validator: validate,
      maxLines:maxLines ,
      decoration: InputDecoration(

        hintText:hintText ,
        labelStyle: const TextStyle(),
        enabledBorder: enabledBorder,
        // const OutlineInputBorder(
        //     borderSide: BorderSide())
        focusedBorder:focusedBorder ,
        // const OutlineInputBorder(
        //     borderSide: BorderSide())
        labelText: label,
        prefixIcon: Icon(
          prefixIcon,
          color: colorIcon,
        ),
        suffixIcon: IconButton(
          icon: Icon(suffixIcon),
          onPressed: suffixPressed,
        ),
        border: border,
      ),
    );
  }
}
