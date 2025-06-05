



import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.label,
    this.hint,
    this.errorMessage,
    this.onChanged,
    this.validator,
    this.obscureText,
  });


  final String? label;
  final String? hint;
  final String? errorMessage;
  final bool? obscureText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
    );
    return TextFormField(
      obscureText: obscureText ?? false,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(borderSide: BorderSide(color: color.primary)),
        errorBorder: border.copyWith(borderSide: BorderSide(color: Colors.red)),
        focusedErrorBorder: border.copyWith(borderSide: BorderSide(color: Colors.red)),
        isDense: true,
        label: label != null ? Text(label!) : const Text('Nombre'),
        hintText: hint,
        focusColor: color.primary,
        // suffix: Icon(Icons.supervised_user_circle_outlined)
        errorText: errorMessage
      )
    );
  }
}