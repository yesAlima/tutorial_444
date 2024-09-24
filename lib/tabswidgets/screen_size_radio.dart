import 'package:flutter/material.dart';

class ScreenSizeRadio extends StatefulWidget {
  const ScreenSizeRadio({super.key});

  @override
  _ScreenSizeRadioState createState() => _ScreenSizeRadioState();
}

class _ScreenSizeRadioState extends State<ScreenSizeRadio> {
  String _selectscreen = '12 inch';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("Screen Size"),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
        ),
        Column(
          children: [
            Row(
              children: [
                const Text("12 inch"),
                Radio(
                    value: '12 inch',
                    groupValue: _selectscreen,
                    onChanged: (value) {
                      setState(() {
                        _selectscreen = value.toString();
                      });
                    }),
              ],
            ),
            Row(
              children: [
                const Text("13 inch"),
                Radio(
                    value: '13 inch',
                    groupValue: _selectscreen,
                    onChanged: (value) {
                      setState(() {
                        _selectscreen = value.toString();
                      });
                    }),
              ],
            ),
            Row(
              children: [
                const Text("14 inch"),
                Radio(
                    value: '14 inch',
                    groupValue: _selectscreen,
                    onChanged: (value) {
                      setState(() {
                        _selectscreen = value.toString();
                      });
                    }),
              ],
            ),
            Row(
              children: [
                const Text("15 inch"),
                Radio(
                    value: '15 inch',
                    groupValue: _selectscreen,
                    onChanged: (value) {
                      setState(() {
                        _selectscreen = value.toString();
                      });
                    }),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
