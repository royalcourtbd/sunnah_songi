import 'package:intl/intl.dart';

String formatDateTimeInBangla(DateTime dateTime) {
  // Weekdays in Bangla
  final List<String> banglaWeekdays = [
    'রবি',
    'সোম',
    'মঙ্গল',
    'বুধ',
    'বৃহস্পতি',
    'শুক্র',
    'শনি'
  ];

  // Months in Bangla
  final List<String> banglaMonths = [
    '',
    'জানুয়ারী',
    'ফেব্রুয়ারী',
    'মার্চ',
    'এপ্রিল',
    'মে',
    'জুন',
    'জুলাই',
    'আগস্ট',
    'সেপ্টেম্বর',
    'অক্টোবর',
    'নভেম্বর',
    'ডিসেম্বর'
  ];

  // Format the date
  final formattedDate = DateFormat('EEEE, d MMMM, y', 'bn').format(dateTime);

  // Replace English weekdays and months with Bangla
  for (int i = 0; i < banglaWeekdays.length; i++) {
    formattedDate.replaceFirst(DateFormat('EEEE', 'en').format(dateTime), banglaWeekdays[i]);
  }

  for (int i = 1; i <= 12; i++) {
    formattedDate.replaceFirst(DateFormat('MMMM', 'en').format(DateTime(dateTime.year, i, 1)), banglaMonths[i]);
  }

  return formattedDate.replaceAll("বার", '');
}
