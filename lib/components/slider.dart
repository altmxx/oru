import 'package:flutter/material.dart';

class AdjustableRangeSlider extends StatefulWidget {
  const AdjustableRangeSlider({super.key});

  @override
  State<AdjustableRangeSlider> createState() => _AdjustableRangeSliderState();
}

class _AdjustableRangeSliderState extends State<AdjustableRangeSlider> {
  double _startValue = 0.0;
  double _endValue = 400000.0;
  @override
  Widget build(BuildContext context) {
    return RangeSlider(
        values: RangeValues(_startValue, _endValue),
        min: 0.0,
        max: 400000.0,
        onChanged: (RangeValues values) {
          setState(() {
            _startValue = values.start;
            _endValue = values.end;
          });
        });
  }
}
