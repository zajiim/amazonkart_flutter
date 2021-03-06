import 'package:flutter/material.dart';

class HomepageTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isObscure;
  const HomepageTextfield(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.isObscure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(12.0),
        isDense: true,
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black45,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black45,
          ),
        ),
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your $hintText';
        }
        return null;
      },
    );
  }
}
