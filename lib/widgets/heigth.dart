import 'package:flutter/material.dart';

class HeigthSelector extends StatefulWidget {
  const HeigthSelector(this.currentSliderValue, this.onChangeSliver, {Key? key})
      : super(key: key);

  final double currentSliderValue;
  final Function(double value) onChangeSliver;

  @override
  _HeigthSelectorState createState() => _HeigthSelectorState();
}

class _HeigthSelectorState extends State<HeigthSelector> {
  // double _currentSliderValue = 183;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8),
      color: const Color(0xff1D1F33),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('HEIGTH'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.currentSliderValue.toStringAsFixed(0),
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 50,
                ),
              ),
              const Text('cm')
            ],
          ),
          Slider(
            onChanged: (double value) => widget.onChangeSliver(value),
            value: widget.currentSliderValue,
            min: 135,
            max: 245,
            activeColor: Colors.white,
            thumbColor: Colors.pink,
          ),
        ],
      ),
    );
  }
}
