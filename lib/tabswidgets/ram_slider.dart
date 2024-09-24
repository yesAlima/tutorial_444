import 'package:flutter/material.dart';

class RamSlider extends StatelessWidget {
  final ValueNotifier<double> ramController;
  const RamSlider({super.key, required this.ramController});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("RAM"),
        SizedBox(width: MediaQuery.of(context).size.width * 0.4),
        Expanded(
          child: ValueListenableBuilder<double>(
            valueListenable: ramController,
            builder: (context, value, child) {
              return Column(
                children: [
                  Slider(
                    value: value,
                    min: 0,
                    max: 16,
                    divisions: 16,
                    label: value.round().toString(),
                    onChanged: (double newValue) {
                      ramController.value = newValue;
                    },
                  ),
                  Text('${value.round()} GB'),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
