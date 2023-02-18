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

///Defnes useful operations on dates
extension DateTimeX on DateTime {
  //Get the day of the week in String
  //Can be either if Monday, Tuesday, ...
  String get weekDay => weekDayMap[weekday];

  String get minutes {
    //This returns the minutes.. If the minutes is a Digit, it returns with a left oadding of 0 for
    //Example. 01
    String minutes = minute.toString();

    if (minute.toString().length == 1) {
      minutes = minutes.padLeft(2, '0');
    }
    return minutes;
  } //Get the minutes value

  ///The month abbrevation like Jan, Feb, Mar, ...
  String get monthName => monthsMap[month];

  ///The month full name like January, Febuary, March, ...
  String get monthFullName => monthsMapFullName[month];

  ///Get the month digit.
  int get monthDigit =>
      month; // Not really neccessary though.. date.month can just be called instead

  /// Get the number of seconds
  int get seconds => second;

  ///Get if the time is Am or Post Meridian
  String get amOrPm {
    String v = 'am';
    //Set the current time meridian to post Meridian or am
    if (hour >= 12) {
      v = 'pm';
    }

    return v;
  }

  ///The Hours to the 12 hour format
  String get hourIn12hourFormat {
    String hours = hour.toString();

    if (hour > 12) {
      hours = (hour - 12).toString();
      // return dateObject.hour - 12;
    }

    if (hours.length == 1) {
      hours = hours.padLeft(2, '0');
    }
    return hours;
  }

  int get dayString => day;
}
