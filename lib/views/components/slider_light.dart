import 'package:flutter/material.dart';

class SliderDialog extends StatefulWidget {
  final double initialValue;

  SliderDialog({required this.initialValue});

  @override
  _SliderDialogState createState() => _SliderDialogState();
}

class _SliderDialogState extends State<SliderDialog> {
  late double sliderValue;

  @override
  void initState() {
    super.initState();
    sliderValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Chọn giá trị'),
      content: Slider(
        value: sliderValue,
        min: 0,
        max: 4,
        onChanged: (value) {
          setState(() {
            sliderValue = (value*10>5?value.ceil():value.floor())*1.0;
          });
        },
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Đóng'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(sliderValue);
          },
          child: Text('Chấp nhận'),
        ),
      ],
    );
  }
}
