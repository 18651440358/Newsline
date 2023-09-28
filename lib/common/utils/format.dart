import 'package:intl/intl.dart';

String getComparedTime(DateTime dateTime) {
    Duration difference = DateTime.now().difference(dateTime);
    final List prefix = [
        "just now",
        "second(s) ago",
        "minute(s) ago",
        "hour(s) ago",
        "day(s) ago",
        "month(s) ago",
        "year(s) ago"
    ];
    if (difference.inDays == 0) {
        if (difference.inMinutes == 0) {
            if (difference.inSeconds < 20) {
                return (prefix[0]);
            } else {
                return ("${difference.inSeconds} ${prefix[1]}");
            }
        } else {
            if (difference.inMinutes > 59) {
                return ("${(difference.inMinutes / 60).floor()} ${prefix[3]}");
            } else {
                return ("${difference.inMinutes} ${prefix[2]}");
            }
        }
    } else {
        if (difference.inDays > 30) {
            if (((difference.inDays) / 30).floor() > 12) {
                return ("${((difference.inDays / 30) / 12).floor()} ${prefix[6]}");
            } else {
                return ("${(difference.inDays / 30).floor()} ${prefix[5]}");
            }
        } else {
            return ("${difference.inDays} ${prefix[4]}");
        }
    }
}

String formattedNumber (int number) =>
    NumberFormat.compactCurrency(
        decimalDigits: 1,
        symbol: '',
    ).format(number);