import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
class Palette {
  static Color white = HexColor.fromHex('#ffffff');
  static Color black = HexColor.fromHex('#000000');
  static Color primaryBackground = HexColor.fromHex('#efefef');

  static Color primaryBackground5 = HexColor.fromHex('#0db8a6');

  static Color primaryBackground3 = HexColor.fromHex('#a2e4dc');

  static Color primaryBackground2 = HexColor.fromHex('#0cb4a4');

  static Color primaryBackground4 = HexColor.fromHex('#22766c');

  static Color primaryBackground1 = HexColor.fromHex('#098f7d');
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
