import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/palette/palette.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(
          color: Palette.orange,
        ),
      ),
    );
  }
}
