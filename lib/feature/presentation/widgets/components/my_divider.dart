import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/palette/palette.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 1,
      color: Palette.black,
      indent: 15.0,
      endIndent: 15.0,
    );
  }
}
