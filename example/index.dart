import 'dart:html';

import 'package:frustration_detector/src/detector.dart';

void main() {
  final detector = FrustrationDetector();
  detector.occurences.listen((o) {
    print(o.dateTime);
    print(o.type);
  });
}
