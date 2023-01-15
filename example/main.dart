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
