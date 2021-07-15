import 'dart:ffi';

class TimeFormatter {
  String toReadable(String time) {
    try {
      final timeNumber = double.parse(time);
      final hours = timeNumber.toInt();
      final minutes = (timeNumber-hours) * 60;
      return createReadableFrom(hours, minutes.round());
    } on Exception {
      return time;
    }
  }

  Float toNumber(String readable) {
    throw UnimplementedError();
  }

  String createReadableFrom(int hours, int minutes) {
    return hours.toString()+"godz "+minutes.toString()+"min";
  }
}
