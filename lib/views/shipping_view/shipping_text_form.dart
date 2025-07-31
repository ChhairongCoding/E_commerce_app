import 'package:flutter/material.dart';

class ShippingTextForm extends StatelessWidget {
  const ShippingTextForm({
    super.key,
    this.hintText,
    this.onSuffixTap,
    this.suffixIcon,
    this.obscureText = false,
    this.validator,
    this.controller,
  });

  final String? hintText;
  final VoidCallback? onSuffixTap;
  final IconData? suffixIcon;
  final bool? obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 6),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.transparent,
            label: RichText(
              text: TextSpan(
                text: hintText ?? "",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                  fontFamily: "ProductSans",
                ),
                children: const [
                  TextSpan(
                    text: " *",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            suffixIcon: suffixIcon != null
                ? IconButton(icon: Icon(suffixIcon), onPressed: onSuffixTap)
                : null,
          ),
          obscureText: obscureText ?? false,
          maxLines: 1,
          validator: validator ??
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
