import 'package:flutter/material.dart';

class CpuDropdown extends StatelessWidget {
  final ValueNotifier<String?> cpuController;

  const CpuDropdown({super.key, required this.cpuController});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text("CPU"),
        SizedBox(width: MediaQuery.of(context).size.width * 0.4),
        Expanded(
          child: ValueListenableBuilder<String?>(
            valueListenable: cpuController,
            builder: (context, value, child) {
              return DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
                hint: const Text("Select Processor"),
                value: value,
                items:
                    <String>['intel i7', 'intel i5', 'AMD'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  cpuController.value = newValue;
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
