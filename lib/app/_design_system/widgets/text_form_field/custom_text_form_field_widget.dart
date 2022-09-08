import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../consts/app_colors_const.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  const CustomTextFormFieldWidget({
    Key? key,
    this.onTap,
    required this.readOnly,
    this.textInputAction,
    required this.labelText,
    required this.hintText,
    required this.textEditingController,
    this.validator,
    this.inputFormatters,
  }) : super(key: key);

  final void Function()? onTap;
  final bool readOnly;
  final TextInputAction? textInputAction;
  final String labelText;
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController textEditingController;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      inputFormatters: inputFormatters,
      onTap: onTap,
      readOnly: readOnly,
      textInputAction: textInputAction,
      cursorColor: ColorsConst.gray,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: labelText,
        hintStyle: const TextStyle(color: Colors.black),
        labelStyle: const TextStyle(color: Colors.black),
        fillColor: ColorsConst.gray,
        iconColor: ColorsConst.gray,
        focusColor: ColorsConst.gray,
        hoverColor: ColorsConst.gray,
        prefixIconColor: ColorsConst.gray,
        suffixIconColor: ColorsConst.gray,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: ColorsConst.gray),
          borderRadius: BorderRadius.circular(3),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: ColorsConst.gray),
          borderRadius: BorderRadius.circular(3),
        ),
      ),
      validator: validator,
    );
  }
}
