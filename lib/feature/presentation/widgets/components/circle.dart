import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/palette/palette.dart';

class Circle extends StatelessWidget {
  final String status;

  const Circle({Key? key, final this.status = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: status == 'Alive'
            ? Palette.green
            : status == 'Dead'
                ? Palette.red
                : Palette.grey,
      ),
    );
  }
}
