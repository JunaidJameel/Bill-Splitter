import 'package:flutter/material.dart';

extension VxPaddingExtensions on Widget {
  Padding p16({Key? key}) =>
      Padding(key: key, padding: const EdgeInsets.all(16), child: this);

  Padding px(double value, {Key? key}) => Padding(
        key: key,
        padding: EdgeInsets.symmetric(horizontal: value),
        child: this,
      );

  Padding py(double value, {Key? key}) => Padding(
        key: key,
        padding: EdgeInsets.symmetric(vertical: value),
        child: this,
      );
}
