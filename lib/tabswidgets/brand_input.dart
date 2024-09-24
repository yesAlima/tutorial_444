import 'package:flutter/material.dart';
import 'package:tutorial_444/utils/texfield.dart';

class BrandInput extends StatelessWidget {
  final TextEditingController controller;
  const BrandInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text("Brand"),
        SizedBox(width: MediaQuery.of(context).size.width * 0.4),
        Expanded(
            child: reusableTextField("Enter laptop Brand", false, controller)),
      ],
    );
  }
}
