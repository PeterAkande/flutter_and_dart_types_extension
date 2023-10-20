class DateFormatter {
  final DateTime dateObject;

  DateFormatter({
    required this.dateObject,
  }) {
    getAmOrPm();
  }

  factory DateFormatter.dateFromString(String date) {
    //This wold parse a date in the form year-month-day

    final dates = date.split('-');

    assert(dates.length == 3);

    return DateFormatter(
      dateObject: DateTime(
        int.parse(dates[0].toString()),
        int.parse(dates[1].toString()),
        int.parse(
          dates[2],
        ),
      ),
    );
  }

  factory DateFormatter.timeFromString(String timeString) {
    //This wold parse a date in the form year-month-day

    final time = timeString.split(':');

    assert(time.length == 3);

    return DateFormatter(
      dateObject: DateTime(
          0, 0, 0, int.parse(time[0]), int.parse(time[1]), int.parse(time[2])),
    );
  }

  String amOrPm = 'am';

  Map monthsMap = {
    1: 'Jan',
    2: 'Feb',
    3: 'Mar',
    4: 'Apr',
    5: 'May',
    6: 'Jun',
    7: 'Jul',
    8: 'Aug',
    9: 'Sep',
    10: 'Oct',
    11: 'Nov',
    12: 'Dec'
  };
  Map monthsMapFullName = {
    1: 'January',
    2: 'February',
    3: 'March',
    4: 'April',
    5: 'May',
    6: 'June',
    7: 'July',
    8: 'August',
    9: 'September',
    10: 'October',
    11: 'November',
    12: 'December'
  };

  Map weekDayMap = {
    1: 'Monday',
    2: 'Tuesday',
    3: 'Wednesday',
    4: 'Thursday',
    5: 'Friday',
    6: 'Saturday',
    7: 'Sunday'
  };

  Map weekDayAbbrevatedMap = {
    1: 'Mon',
    2: 'Tue',
    3: 'Wed',
    4: 'Thu',
    5: 'Fri',
    6: 'Sat',
    7: 'Sun'
  };

  //Get the day of the week in String
  //Can be either if Monday, Tuesday, ...
  String get weekDay => weekDayMap[dateObject.weekday];

  String get weekDayAbbrevated => weekDayAbbrevatedMap[dateObject.weekday];

  int get year => dateObject.year; //Get the year

  String get minutes {
    String minutes = dateObject.minute.toString();

    if (dateObject.minute.toString().length == 1) {
      minutes = minutes.padLeft(2, '0');
    }
    return minutes;
  } //Get the minutes value

  String get month => monthsMap[
      dateObject.month]; //Get the month abbrevation like Jan, Feb, March, ...
  String get monthFullName => monthsMapFullName[
      dateObject.month]; //Get the month abbrevation like Jan, Feb, March, ...

  int get monthDigit => dateObject.month;

  int get seconds => dateObject.second;

  getAmOrPm() {
    //Set the current time meridian to post Meridian or am
    if (dateObject.hour >= 12) {
      amOrPm = 'pm';
    }
  }

  String get hour {
    //This returns the Hours.. and restructure it to the 12 hour format

    String hours = dateObject.hour.toString();

    if (dateObject.hour > 12) {
      hours = (dateObject.hour - 12).toString();
      // return dateObject.hour - 12;
    }

    if (hours == '0') {
      hours = '12'; // 12 instead of 0
    }

    if (hours.length == 1) {
      hours = hours.padLeft(2, '0');
    }
    return hours;
  }

  int get day => dateObject.day; //Give the day number like 31, 28, 20

  static String getDatePassedSinceCommentMade(DateTime date,
      {bool abbreviatePeriod = true}) {
    //This would return the number of minutes or seconds that has passed since when the message was sent

    int numberOfMilliSeconds =
        DateTime.now().millisecondsSinceEpoch - date.millisecondsSinceEpoch;

    return DateFormatter.getCorrectTimeFormatting(numberOfMilliSeconds,
        abbreviatePeriod: abbreviatePeriod);
  }

  static String getCorrectTimeFormatting(int milliSeconds,
      {bool abbreviatePeriod = true}) {
    int numberOfSeconds = milliSeconds ~/ 1000;

    if (numberOfSeconds == 0) {
      return 'just now';
    }

    if (numberOfSeconds <= 60) {
      //It is less than or equal to a minute
      return '$numberOfSeconds s';
    }

    if (numberOfSeconds > 60 && numberOfSeconds <= 3600) {
      //The number of seconds is greater than a minute and lesser than an hour

      int numberOfMinutes = numberOfSeconds ~/ 60;

      return abbreviatePeriod ? '$numberOfMinutes m' : '$numberOfMinutes m';
    }

    if (numberOfSeconds > 3600 && numberOfSeconds <= 3600 * 24) {
      //Greater than an hour but less than a day

      int numberOfHours = numberOfSeconds ~/ 3600;

      return abbreviatePeriod ? '$numberOfHours h' : '$numberOfHours hours';
    }

    if (numberOfSeconds > 3600 * 24) {
      int numberOfDays = numberOfSeconds ~/ (3600 * 24);

      return abbreviatePeriod ? '$numberOfDays d' : '$numberOfDays days';
    }

    return '';
  }
}

extension DateTimeX on DateTime {
  DateFormatter get dateFormatter => DateFormatter(dateObject: this);
}
