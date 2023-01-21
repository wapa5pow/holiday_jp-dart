part 'holiday.g.dart';

class Holiday {
  final String date;
  final String week;
  final String weekEn;
  final String name;
  final String nameEn;

  Holiday({
    required this.date,
    required this.week,
    required this.weekEn,
    required this.name,
    required this.nameEn,
  });

  @override
  bool operator ==(Object other) =>
      other is Holiday &&
      other.date == date &&
      other.week == week &&
      other.weekEn == weekEn &&
      other.name == name &&
      other.nameEn == nameEn;

  @override
  int get hashCode => Object.hash(
        date,
        week,
        weekEn,
        name,
        nameEn,
      );
}

/// Return [Holiday]
///
/// If [dateTime] is not holiday, it returns null.
Holiday? getHoliday(DateTime dateTime) {
  final date =
      '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';
  return holidays.containsKey(date) ? holidays[date] : null;
}

/// Return true if [dateTime] is holiday
bool isHoliday(DateTime dateTime) {
  return getHoliday(dateTime) != null;
}

/// Find [Holiday]s between parameters
List<Holiday> between(DateTime start, DateTime end) {
  final results = <Holiday>[];
  for (;; start = start.add(Duration(days: 1))) {
    if (start.isAfter(end)) {
      break;
    }
    final holiday = getHoliday(start);
    if (holiday != null) {
      results.add(holiday);
    }
  }
  return results;
}
