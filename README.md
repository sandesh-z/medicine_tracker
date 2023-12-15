# medicine_tracker

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

### To generate and update locale file and translations

All translation keys are maintained on this doc :https://docs.google.com/spreadsheets/d/16BTt5iD7AwcDexI7vGBMmR0QB30xaL9fQ1-BSnZczgU/edit#gid=0
Export each sheet to tsv and put them inside gen/tsv_files
then run:
dart run gen/generate.dart
flutter gen-l10n
flutter pub get
