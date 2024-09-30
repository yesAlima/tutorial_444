// ignore_for_file: library_private_types_in_public_api, camel_case_types

import 'package:flutter/material.dart';

class reusableTextField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;

  const reusableTextField(this.hintText, this.isPassword, this.controller,
      {super.key});

  @override
  _reusableTextFieldState createState() => _reusableTextFieldState();
}

class _reusableTextFieldState extends State<reusableTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscureText,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        color: Colors.black,
        fontSize: 12.0,
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off),
              )
            : null,
        contentPadding: const EdgeInsets.only(top: 16.0),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.black.withOpacity(0.5),
          fontSize: 12.0,
        ),
      ),
    );
  }
}
