import 'package:flutter/material.dart';

class GpuDropdown extends StatelessWidget {
  final ValueNotifier<String?> gpuController;
  const GpuDropdown({super.key, required this.gpuController});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text("GPU"),
        SizedBox(width: MediaQuery.of(context).size.width * 0.4),
        Expanded(
          child: ValueListenableBuilder<String?>(
            valueListenable: gpuController,
            builder: (context, value, child) {
              return DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
                hint: const Text("Select GPU"),
                value: value,
                items: <String>[
                  'Apple M2 pro',
                  'intel Iris',
                  'AMD Radeon',
                  'NVida GeForce'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  gpuController.value = newValue;
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
