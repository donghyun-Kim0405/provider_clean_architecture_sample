import 'package:logger/logger.dart';

class EmptyLogger implements Logger {

  @override
  Future<void> close() async {
    // Do nothing as this logger does not open any resources
  }

  @override
  void d(message, {DateTime? time, Object? error, StackTrace? stackTrace}) {
    // Do nothing for debug messages
  }

  @override
  void e(message, {DateTime? time, Object? error, StackTrace? stackTrace}) {
    // Do nothing for error messages
  }

  @override
  void f(message, {DateTime? time, Object? error, StackTrace? stackTrace}) {
    // Do nothing for fatal messages
  }

  @override
  void i(message, {DateTime? time, Object? error, StackTrace? stackTrace}) {
    // Do nothing for info messages
  }

  @override
  Future<void> get init async {
    // Do nothing as this logger does not require initialization
  }

  @override
  bool isClosed() {
    // Always return true as there are no resources to manage
    return true;
  }

  @override
  void log(Level level, message, {DateTime? time, Object? error, StackTrace? stackTrace}) {
    // Do nothing for log messages
  }

  @override
  void t(message, {DateTime? time, Object? error, StackTrace? stackTrace}) {
    // Do nothing for trace messages
  }

  @override
  void v(message, {DateTime? time, Object? error, StackTrace? stackTrace}) {
    // Do nothing for verbose messages
  }

  @override
  void w(message, {DateTime? time, Object? error, StackTrace? stackTrace}) {
    // Do nothing for warning messages
  }

  @override
  void wtf(message, {DateTime? time, Object? error, StackTrace? stackTrace}) {
    // Do nothing for wtf messages
  }
}
