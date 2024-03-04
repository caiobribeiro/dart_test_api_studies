import 'dart:io';

import 'package:flutterando_tests/models/line_report.dart';

void main(List<String> args) {
  final result = coverage(lcovPath: args[0]);
  print(result);
}

String coverage({required String lcovPath}) {
  final file = File(lcovPath);
  final content = file.readAsLinesSync();
  final reports = <LineReport>[];
  var sourceFile = '';
  var lineFound = 0;
  var lineHit = 0;

  for (var text in content) {
    if (text == 'end_of_record') {
      final report = LineReport(
        sourceFile: sourceFile,
        lineFound: lineFound,
        lineHit: lineHit,
      );
      reports.add(report);
      continue;
    }
    final line = text.split(':');
    if (line[0] == 'SF') {
      sourceFile = line[1];
    } else if (line[0] == 'LF') {
      lineFound = int.parse(line[1]);
    } else if (line[0] == 'LH') {
      lineHit = int.parse(line[1]);
    }
  }

  int totalLineFound = 0;
  int totalLineHit = 0;

  for (var report in reports) {
    totalLineFound += report.lineFound;
    totalLineHit += report.lineHit;
  }
  final percent = (totalLineHit / totalLineFound) * 100;
  return '${percent.round().toString()}%';
}
