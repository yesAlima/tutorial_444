import 'package:flutter/material.dart';

class IsInstalledCheckbox extends StatelessWidget {
  final ValueNotifier<bool> installedController;
  const IsInstalledCheckbox({
    super.key,
    required this.installedController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('is Window intalled'),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
        ),
        ValueListenableBuilder<bool>(
          valueListenable: installedController,
          builder: (context, value, child) {
            return Checkbox(
                value: value,
                onChanged: (bool? newValue) {
                  if (newValue != null) {
                    installedController.value = newValue;
                  }
                });
          },
        ),
      ],
    );
  }
}
