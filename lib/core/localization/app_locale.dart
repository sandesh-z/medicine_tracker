import 'package:flutter/material.dart';

class AppLocale {
  final Locale locale;
  final String flagSymbol;
  final String name;

  const AppLocale({
    required this.locale,
    required this.flagSymbol,
    required this.name,
  });
  static const english = AppLocale(
    locale: Locale('en', ''),
    flagSymbol: '🇬🇧',
    name: 'English',
  );

  static const nepalese = AppLocale(
    locale: Locale('ne', ''),
    flagSymbol: '🇯🇵',
    name: 'Nepali',
  );

  static List<AppLocale> get allLocales => [english, nepalese];
}
