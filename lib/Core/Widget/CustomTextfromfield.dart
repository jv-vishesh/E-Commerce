import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.validators,
    this.decoration,
    this.controller,
    this.obscureText = false,
    this.obscuringCharacter = '•',
    required this.label,
  });

  final String? hintText;
  final String? Function(String?)? validators;
  final InputDecoration? decoration;
  final TextEditingController? controller;
  final String obscuringCharacter;
  final bool obscureText;
  final String label;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validators,
      decoration: InputDecoration(
          label: Text(widget.label,style: const TextStyle(fontSize: 11)),
          hintText: widget.hintText,
          filled: true,
          fillColor: const Color(0xF2F2F2),
          border: const OutlineInputBorder()),
      controller: widget.controller,
      obscureText: widget.obscureText,
      obscuringCharacter: widget.obscuringCharacter,
    );
  }
}
