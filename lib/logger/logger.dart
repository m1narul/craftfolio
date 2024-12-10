import 'package:flutter/material.dart';

class Logger {
  // Log levels
  static const String info = 'INFO';
  static const String warning = 'WARNING';
  static const String error = 'ERROR';

  // Method to log info
  static void logInfo(String message) {
    _log(info, message);
  }

  // Method to log warnings
  static void logWarning(String message) {
    _log(warning, message);
  }

  // Method to log errors
  static void logError(String message) {
    _log(error, message);
  }

  // Private method to handle logging format
  static void _log(String level, String message) {
    final timestamp = DateTime.now().toIso8601String();
    debugPrint('[$timestamp] [$level] $message');
  }
}
