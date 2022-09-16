import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class Log {
  static void logInfo(String message) {
    if (kDebugMode) {
      return Logger().i(message);
    }
  }
}
