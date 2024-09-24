import 'package:flutter/material.dart';

class WeightSlider extends StatelessWidget {
  final ValueNotifier<double> weightcontroller;
  const WeightSlider({super.key, required this.weightcontroller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("Weight"),
        SizedBox(width: MediaQuery.of(context).size.width * 0.4),
        Expanded(
          child: ValueListenableBuilder<double>(
            valueListenable: weightcontroller,
            builder: (context, value, child) {
              return Column(
                children: [
                  Slider(
                    value: value,
                    min: 0,
                    max: 3,
                    divisions: 6,
                    label: value.toStringAsFixed(2),
                    onChanged: (double newValue) {
                      weightcontroller.value = newValue;
                    },
                  ),
                  Text('${value.toStringAsFixed(2)} KG'),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
