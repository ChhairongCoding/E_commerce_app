import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  final String? label;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final Icon? iconField;

  const TextFormWidget({
    super.key,
    this.label,
    this.hintText,
    this.controller,
    this.validator,
    this.obscureText,
    this.iconField
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$label", style: Theme.of(context).textTheme.bodyMedium),
        SizedBox(height: 6),
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            filled: true,
            fillColor: Colors.transparent,
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 16),
            prefixIcon: iconField,
          ),
          obscureText: obscureText ?? false,
          maxLines: 1,
          validator:
              validator ??
              (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter some text";
                }
                return null;
              },
        ),
      ],
    );
  }
}
