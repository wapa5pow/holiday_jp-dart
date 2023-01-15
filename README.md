# holiday_jp-dart

[![Pub Version](https://img.shields.io/pub/v/holiday_jp?color=blueviolet)](https://pub.dev/packages/holiday_jp)
[![test](https://github.com/wapa5pow/holiday_jp-dart/actions/workflows/ci.yml/badge.svg)](https://github.com/wapa5pow/holiday_jp-dart/actions/workflows/ci.yml)
[![latest_holiday_jp](https://github.com/wapa5pow/holiday_jp-dart/actions/workflows/latest_holiday_jp.yml/badge.svg)](https://github.com/wapa5pow/holiday_jp-dart/actions/workflows/latest_holiday_jp.yml)

🎌 Japanese holiday for Dart

This library uses [holiday_jp](https://github.com/holiday-jp/holiday_jp) as Japanese holiday dataset.

## Example

```dart
import 'package:holiday_jp/holiday_jp.dart' as holiday_jp;
import 'package:intl/intl.dart';

final _formatter = DateFormat('yyyy-MM-dd');

void main(List<String> arguments) {
  final marineDay = DateTime.utc(2020, 7, 23);

  final holiday = holiday_jp.getHoliday(marineDay);
  if (holiday == null) {
    throw Exception('holiday mus not be null');
  }
  print('${holiday.date} is ${holiday.nameEn} in Japan.\n');

  final isMarineDayHoliday = holiday_jp.isHoliday(marineDay);
  print(
      'The question whether Marine Day is holiday or not is $isMarineDayHoliday.\n');

  final start = DateTime.utc(2022, 1, 1);
  final end = DateTime.utc(2022, 1, 15);
  final holidays = holiday_jp.between(start, end);
  print(
      'Holidays between ${_formatter.format(start)} and ${_formatter.format(end)} are the followings.');
  for (final holiday in holidays) {
    print('- ${holiday.date} is ${holiday.nameEn}');
  }
}
```

## Tools

To update generated holiday file, run the following.

```bash
./tool/update_holidays.sh
```