import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/palette/palette.dart';

class Utilities {
  static void showSnackBar(
    final BuildContext context,
    final String text, {
    final bool isGood = false,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: isGood ? Palette.green : Palette.red,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 1),
        elevation: 5,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.warning, color: Colors.white),
            const SizedBox(width: 15),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
