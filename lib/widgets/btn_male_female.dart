import 'package:flutter/material.dart';

class BtnMaleFemale extends StatefulWidget {
  const BtnMaleFemale(this.icon, this.title, this.isSelected, this.switchGenere,
      {Key? key})
      : super(key: key);

  final IconData icon;
  final String title;
  final bool isSelected;
  final Function switchGenere;

  @override
  State<BtnMaleFemale> createState() => _BtnMaleFemaleState();
}

class _BtnMaleFemaleState extends State<BtnMaleFemale> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => widget.switchGenere(),
        child: Container(
          color: const Color(0xff1D1F33),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                size: 70,
                color: widget.isSelected ? Colors.white : Colors.white54,
              ),
              Text(
                widget.title,
                style: TextStyle(
                  color: widget.isSelected ? Colors.white : Colors.white38,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
