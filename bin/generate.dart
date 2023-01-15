import 'dart:convert';
import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:yaml/yaml.dart';

/// Generate holiday.g.dart using holiday_jp dataset
void main() {
  final document =
      loadYaml(File('holiday_jp/holidays_detailed.yml').readAsStringSync())
          as YamlMap;
  final dates = (document.keys.toList())..sort();

  // generate holidays
  final sink = File('lib/holiday.g.dart').openWrite();
  sink.add(utf8.encode("""
part of 'holiday.dart';

final holidays = {
"""));

  for (final date in dates) {
    final holiday = document[date] as YamlMap;
    sink.add(utf8.encode("""
  "${holiday["date"]}": Holiday(
    date: "${holiday['date']}",
    week: "${holiday['week']}",
    weekEn: "${holiday['week_en']}",
    name: "${holiday['name']}",
    nameEn: "${holiday['name_en']}",
  ),
"""));
  }

  sink.add(utf8.encode("};\n"));
}
