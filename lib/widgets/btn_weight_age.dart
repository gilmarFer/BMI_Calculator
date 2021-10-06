import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class BtnWeightAge extends StatefulWidget {
  const BtnWeightAge(this.title, this.initialValue, this.changeValue,
      {Key? key})
      : super(key: key);

  final String title;
  final int initialValue;
  final Function(bool value) changeValue;

  @override
  State<BtnWeightAge> createState() => _BtnWeightAgeState();
}

class _BtnWeightAgeState extends State<BtnWeightAge> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: const Color(0xff1D1F33),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(widget.title),
            Text(
              widget.initialValue.toString(),
              style: const TextStyle(
                fontSize: 35,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xff1C2033),
                  child: IconButton(
                    icon: const Icon(LineIcons.minus),
                    onPressed: () {
                      setState(() {
                        if (widget.initialValue == 0) return;
                        widget.changeValue(false);
                      });
                    },
                    color: Colors.white,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: const Color(0xff1C2033),
                  child: IconButton(
                    icon: const Icon(LineIcons.plus),
                    onPressed: () {
                      setState(() {
                        widget.changeValue(true);
                      });
                    },
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
