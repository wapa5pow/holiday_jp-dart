import 'package:holiday_jp/holiday.dart';
import 'package:test/test.dart';

void main() {
  final marineDay = DateTime.utc(2020, 7, 23);

  group('$Holiday', () {
    final holiday1 = Holiday(
      date: '2022-07-23',
      week: '木',
      weekEn: 'Thursday',
      name: '海の日',
      nameEn: 'Marine Day',
    );
    final holiday2 = Holiday(
      date: '2022-07-23',
      week: '木',
      weekEn: 'Thursday',
      name: '海の日',
      nameEn: 'Marine Day',
    );
    final holiday3 = Holiday(
      date: '1970-01-01',
      week: '木',
      weekEn: 'Thursday',
      name: '元旦',
      nameEn: 'New Year\'s Day',
    );

    test('equality', () {
      expect(holiday1, holiday2);
      expect(holiday1, isNot(holiday3));
    });
  });

  group('getHoliday', () {
    test('Marine Day is holiday', () {
      final holiday = getHoliday(marineDay);
      expect(holiday, isNotNull);
      expect(holiday!.date, '2020-07-23');
      expect(holiday.week, '木');
      expect(holiday.weekEn, 'Thursday');
      expect(holiday.name, '海の日');
      expect(holiday.nameEn, 'Marine Day');
    });

    test('1970-01-02 is not holiday', () {
      expect(getHoliday(DateTime.utc(1970, 1, 2)), isNull);
    });
  });

  group('isHoliday', () {
    final testCases = [
      [DateTime.utc(1970, 1, 1), true],
      [DateTime.utc(1970, 1, 1, 1, 1, 1, 1), true],
      [DateTime.utc(1970, 1, 2, 1, 1, 1, 1), false],
      [DateTime.utc(1970, 1, 2, 0, 0, 0, 0), false],
      [marineDay, true],
    ];

    for (final testCase in testCases) {
      final input = testCase[0] as DateTime;
      final want = testCase[1] as bool;
      test('Check $input is holiday or not', () {
        expect(isHoliday(input), want);
      });
    }
  });

  group('between', () {
    final testCases = [
      [
        DateTime.utc(1970, 1, 1, 1, 1, 1, 1),
        DateTime.utc(1970, 1, 1, 1, 1, 1, 1),
        [
          Holiday(
            date: '1970-01-01',
            week: '木',
            weekEn: 'Thursday',
            name: '元日',
            nameEn: 'New Year\'s Day',
          ),
        ]
      ],
      [
        DateTime.utc(1970, 1, 1, 1, 1, 1, 1),
        DateTime.utc(1970, 1, 2, 1, 1, 1, 1),
        [
          Holiday(
            date: '1970-01-01',
            week: '木',
            weekEn: 'Thursday',
            name: '元日',
            nameEn: 'New Year\'s Day',
          ),
        ]
      ],
      [
        DateTime.utc(1970, 1, 1, 1, 1, 1, 1),
        DateTime.utc(1970, 1, 14, 1, 1, 1, 1),
        [
          Holiday(
            date: '1970-01-01',
            week: '木',
            weekEn: 'Thursday',
            name: '元日',
            nameEn: 'New Year\'s Day',
          ),
        ]
      ],
      [
        DateTime.utc(1970, 1, 1, 1, 1, 1, 1),
        DateTime.utc(1970, 1, 15, 1, 1, 1, 1),
        [
          Holiday(
            date: '1970-01-01',
            week: '木',
            weekEn: 'Thursday',
            name: '元日',
            nameEn: 'New Year\'s Day',
          ),
          Holiday(
            date: '1970-01-15',
            week: '木',
            weekEn: 'Thursday',
            name: '成人の日',
            nameEn: 'Coming of Age Day',
          ),
        ]
      ],
      [
        marineDay,
        marineDay,
        [
          Holiday(
            date: '2020-07-23',
            week: '木',
            weekEn: 'Thursday',
            name: '海の日',
            nameEn: 'Marine Day',
          ),
        ]
      ],
    ];

    for (final testCase in testCases) {
      final start = testCase[0] as DateTime;
      final end = testCase[1] as DateTime;
      final want = testCase[2] as List<Holiday>;
      test('from $start to $end', () {
        expect(between(start, end), want);
      });
    }
  });
}
