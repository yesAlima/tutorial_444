import 'package:flutter/material.dart';

class IsHdSwitch extends StatelessWidget {
  final ValueNotifier<bool> isHdSsdController;
  const IsHdSwitch({super.key, required this.isHdSsdController});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("is HD SSD"),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
        ),
        ValueListenableBuilder<bool>(
          valueListenable: isHdSsdController,
          builder: (context, value, child) {
            return Switch(
              value: value,
              onChanged: (bool newValue) {
                isHdSsdController.value = newValue;
              },
            );
          },
        ),
      ],
    );
  }
}
