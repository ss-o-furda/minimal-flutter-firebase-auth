import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool autocorrect;
  final bool enableSuggestions;
  final bool obscureText;
  final TextInputType keyboardType;
  final List<String> autofillHints;
  const TextInput({
    super.key,
    required this.controller,
    required this.hintText,
    required this.autocorrect,
    required this.enableSuggestions,
    required this.obscureText,
    required this.keyboardType,
    required this.autofillHints,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        autocorrect: autocorrect,
        enableSuggestions: enableSuggestions,
        autofillHints: autofillHints,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: Colors.grey[200],
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.deepPurple),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
