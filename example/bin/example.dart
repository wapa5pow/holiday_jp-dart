import 'package:holiday_jp/holiday_jp.dart';

void main(List<String> arguments) {
  final holiday = getHoliday(DateTime(2020, 7, 23));
  if (holiday == null) {
    throw Exception('holiday mus not be null');
  }
  print('${holiday.date} is ${holiday.nameEn} in Japan.');
}
