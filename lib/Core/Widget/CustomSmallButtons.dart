import 'package:flutter/material.dart';

class SmallIconButton extends StatefulWidget {
  final Icon? icons;
  final Function()? onTaps;

  const SmallIconButton({super.key, this.icons, this.onTaps});

  @override
  State<SmallIconButton> createState() => _SmallIconButtonState();
}

class _SmallIconButtonState extends State<SmallIconButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onTaps,
        child: Container(
          width: 92,
          height: 64,
          decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.circular(24)
          ), child:widget.icons,));
  }
}
