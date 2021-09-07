import 'package:flutter/material.dart';

lineDivider({color: const Color(0xffe8e8e8)}) {
  return Container(
    height: 1,
    decoration: BoxDecoration(
      border: Border.all(
        color: color,
        width: 1
      )
    )
  );
}