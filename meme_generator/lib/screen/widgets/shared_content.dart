import 'package:flutter/material.dart';

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
