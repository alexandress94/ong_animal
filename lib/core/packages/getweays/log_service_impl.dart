import 'package:get/get.dart';
import 'package:ong_animals/core/packages/contracts/log_service.dart';
import 'package:logger/logger.dart';

class LogServiceImpl extends GetxService implements LogService {
  final Logger _logger = Logger();

  List<String> _messages = [];

  Future<LogService> getInstance() async {
    info('servico de log iniciado!!!');
    return this;
  }

  @override
  void append(message) {
    _messages.add(message);
  }

  @override
  void closeAppend() {
    info(_messages.join('\n'));
    _messages = [];
  }

  @override
  void debug(message, [error, StackTrace? stackTrace]) {
    _logger.d(message, error, stackTrace);
  }

  @override
  void error(message, [error, StackTrace? stackTrace]) {
    _logger.e(message, error, stackTrace);
  }

  @override
  void info(message, [error, StackTrace? stackTrace]) {
    _logger.i(message, error, stackTrace);
  }

  @override
  void warning(message, [error, StackTrace? stackTrace]) {
    _logger.w(message, error, stackTrace);
  }
}
