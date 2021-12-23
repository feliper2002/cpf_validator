import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final String? initialValue;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextStyle? style;
  final TextAlign textAlign;
  final int? maxLength;
  final Function(String?)? onChanged;
  final TextEditingController? controller;
  const CustomField({
    Key? key,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.initialValue,
    this.decoration,
    this.textCapitalization = TextCapitalization.none,
    this.textAlign = TextAlign.start,
    this.keyboardType,
    this.style,
    this.maxLength,
    this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      child: TextFormField(
        controller: controller,
        initialValue: initialValue,
        decoration: decoration,
        keyboardType: keyboardType,
        textCapitalization: textCapitalization,
        textAlign: textAlign,
        style: style,
        maxLength: maxLength,
        onChanged: onChanged,
      ),
    );
  }
}
