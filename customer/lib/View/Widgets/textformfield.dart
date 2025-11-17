import 'package:customer/View/Widgets/color.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Widget? lable;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final int maxLines;
  final int? maxlength;
  final double FontSize;
  final EdgeInsetsGeometry contentPadding;
  final Color fillColor;
  final double borderRadius;
  final bool enabled;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.lable,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.validator,
    this.maxLines = 1,
    this.maxlength,
    this.FontSize = 12,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 14,
      vertical: 14,
    ),
    this.fillColor = const Color(0xFF324DA1),
    this.borderRadius = 5,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(color: Color(0xFF4F46E5)),
    );

    return TextFormField(
      maxLength: maxlength,
      enabled: enabled,
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLines: obscureText ? 1 : maxLines,
      style: TextStyle(color: Colors.white),

      decoration: InputDecoration(
        label: lable,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white, fontSize: FontSize),
        // labelStyle:  TextStyle(color: CustomColor.Text_Color),
        filled: true,
        fillColor: fillColor,
        //fillColor:Colors.transparent,
        contentPadding: contentPadding,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: border,
        enabledBorder: border,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: Colors.white, width: 1.2),
        ),
        disabledBorder: border,
      ),
    );
  }
}
