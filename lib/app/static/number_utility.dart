import 'package:sunnah_songi/app/common/config/sunnah_screen.dart';
import 'package:sunnah_songi/app/static/constants.dart';

extension NumberUtilityExt on num {
  Duration get inMilliseconds => Duration(microseconds: (this * 1000).round());

  Duration get inSeconds => Duration(milliseconds: (this * 1000).round());

  Duration get inMinutes =>
      Duration(seconds: (this * Duration.secondsPerMinute).round());

  Duration get inHours =>
      Duration(minutes: (this * Duration.minutesPerHour).round());

  Duration get inDays => Duration(hours: (this * Duration.hoursPerDay).round());
}

bool isEnglishNumber({required String text}) {
  final bool? isNumber = catchAndReturn(() {
    final RegExp numericRegex = RegExp(r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$');
    return numericRegex.hasMatch(text);
  });
  return isNumber ?? false;
}

bool isBanglaNumber({required String text}) {
  final bool? isNumber = catchAndReturn(() {
    final RegExp numericRegex = RegExp(r'^[০-৯]+$');
    return numericRegex.hasMatch(text);
  });
  return isNumber ?? false;
}

T? catchAndReturn<T>(T Function() function) {
  try {
    return function();
  } catch (error, trace) {
    logErrorStatic("error: $error trace: $trace", packageName);
    return null;
  }
}
