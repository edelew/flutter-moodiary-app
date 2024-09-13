import 'package:flutter/material.dart';

abstract class AppShadows {
  static const mainShadow = [
    BoxShadow(
      color: Color.fromRGBO(182, 161, 192, 0.11),
      blurRadius: 10.8,
      offset: Offset(2, 4),
    )
  ];
}
