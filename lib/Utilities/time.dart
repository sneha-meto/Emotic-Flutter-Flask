//String datetime = "Thu, 21 Apr 2022 11:51:30 GMT";

String getTimeDifferenceFromNow(DateTime dateTime, month) {
  Duration difference = DateTime.now().difference(dateTime);
  if (difference.inSeconds < 5) {
    return "Just now";
  } else if (difference.inMinutes < 1) {
    return "${difference.inSeconds}s";
  } else if (difference.inHours < 1) {
    return "${difference.inMinutes}m";
  } else if (difference.inHours < 24) {
    return "${difference.inHours}h";
  } else if (difference.inDays < 365) {
    return "${dateTime.day} $month";
  } else {
    return "${dateTime.day} $month ${dateTime.year}";
  }
}

String getTime(datetime) {
  int month;
  String monthInString = datetime.substring(8, 11);
  int day = int.parse(datetime.substring(5, 7));
  int hours = int.parse(datetime.substring(17, 19));
  int min = int.parse(datetime.substring(20, 22));
  int second = int.parse(datetime.substring(23, 25));
  int year = int.parse(datetime.substring(12, 16));
  DateTime _dateTime;
  switch (monthInString) {
    case 'Jan':
      month = 1;
      break;
    case 'Feb':
      month = 2;
      break;
    case 'Mar':
      month = 3;
      break;
    case 'Apr':
      month = 4;
      break;
    case 'May':
      month = 5;
      break;
    case 'Jun':
      month = 6;
      break;
    case 'Jul':
      month = 7;
      break;
    case 'Aug':
      month = 8;
      break;
    case 'Sep':
      month = 9;
      break;
    case 'Oct':
      month = 10;
      break;
    case 'Nov':
      month = 11;
      break;
    case 'Dec':
      month = 12;
      break;
    default:
      month = 0;
  }

  _dateTime = DateTime.utc(year, month, day, hours, min, second);

  return getTimeDifferenceFromNow(_dateTime, monthInString);
}
