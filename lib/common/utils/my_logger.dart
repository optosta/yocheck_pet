
import 'package:logger/logger.dart';

var logger = Logger(
    printer: PrettyPrinter(
      methodCount: 1,      // number of method calls to be displayed
      errorMethodCount: 8, // number of method calls if stacktrace is provided
      lineLength: 120,     // width of the output
      colors: true,        // Colorful log messages
      printEmojis: false,  // Print an emoji for each log message
    )
);