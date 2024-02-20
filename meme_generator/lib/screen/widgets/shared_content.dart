import 'package:flutter/material.dart';
import 'package:meme_generator/theme/colors.dart';

const mainPadding = EdgeInsets.symmetric(
  horizontal: 10,
  vertical: 10,
);

Decoration gradientDecoration() => const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: <Color>[
          Colors.deepPurple,
          Color.fromARGB(255, 195, 49, 221),
        ],
      ),
    );

final scaleButtonDecoration = ButtonStyle(
  foregroundColor: const MaterialStatePropertyAll(AppColors.mainWhite),
  backgroundColor: MaterialStatePropertyAll(
    Colors.white.withAlpha(40),
  ),
);
