import 'package:duka_user/core/utils/constants.dart';
import 'package:jiffy/jiffy.dart';

class StringUtils {

  static String checkToday(DateTime time) {
    Jiffy today = Jiffy(DateTime.now());
    Jiffy dateTime = Jiffy(time);
    if (dateTime.isSame(today, Units.DAY)) {
      return 'Today';
    }
    return dateTime.format('dd-MM-yyyy');
  }

  static String checkTime(DateTime time) {
    Jiffy today = Jiffy(DateTime.now());
    Jiffy dateTime = Jiffy(time);
    num dateDiffSec = today.diff(dateTime, Units.SECOND);
    //Checking if its less than a minute
    if (dateDiffSec < 60) {
      return '$dateDiffSec seconds ago';
    }
    //Checking if its less than an hour
    else if (dateDiffSec < 3600) {
      int dateDiffMin = dateDiffSec ~/ 60;
      return '$dateDiffMin mins ago';
    }
    //Checking if its less than a day
    else if (dateDiffSec < 86400) {
      int dateDiffHr = dateDiffSec ~/ 3600;
      return '$dateDiffHr hrs ago';
    }
    //Checking if its less than 2 days
    else if (dateDiffSec < 172800) {
      int dateDiffDay = dateDiffSec ~/ 86400;
      return '$dateDiffDay days ago';
    }
    return dateTime.format('EEEE, do MMMM, yyyy');
  }

  static String numFormatNoDecimal(dynamic number){
    return kNumFormatNoDecimal.format(number);
  }

  static String numFormatDecimal(dynamic number){
    return kNumFormatDecimal.format(number);
  }

  static String formatCompletedOrderDate(DateTime dateTime){
    return Jiffy(dateTime).format('do MMM, yyyy h:mm a');
  }

  static String timeDiffInMinutes(DateTime before, DateTime after){
    Jiffy departure = Jiffy(before);
    Jiffy arrival = Jiffy(after);
    return '${arrival.diff(departure, Units.MINUTE)}';
  }

  static String formatCompletedOrderTime(DateTime dateTime){
    return Jiffy(dateTime).format('h:mm a');
  }

}