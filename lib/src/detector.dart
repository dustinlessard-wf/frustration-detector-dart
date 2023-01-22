import 'dart:async';
import 'dart:html';

import 'package:rxdart/rxdart.dart';

class FrustrationDetector {
  StreamController _occurrenceController =
      StreamController<FrustrationOccurence>.broadcast();
  Stream<FrustrationOccurence> occurences;

  FrustrationDetector() {
    occurences = _occurrenceController.stream;

    // pattern to detect: rage clicking, 3 clicks within 750ms
    final rageClickPeriod =
        Stream<dynamic>.periodic(const Duration(milliseconds: 750));
    window.document.onClick.buffer(rageClickPeriod).listen((clicks) {
      if (clicks.length >= 3) {
        _occurrenceController.add(FrustrationOccurence()
          ..type = 'rageClick'
          ..dateTime = DateTime.now());
      }
    });

    // pattern to detect: erratic mouse movements, rapid changes in direction
    var velocity;
    var direction;
    var directionChangeCount = 0;
    var distance = 0;
    window.document.onMouseMove.listen((MouseEvent event) {
      var newDirecion = event.offset.x.sign;
      distance = event.offset.x.abs() + event.offset.y.abs();
      if (newDirecion != direction) {
        direction = newDirecion;
        directionChangeCount++;
      }
    });
  }

// todo: pattern to detect:dead/random clicking (clicking on non-clickable elements)
// todo: pattern to detect:rage scrolling
// todo: pattern to detect:random scrolling
// todo: pattern to detect:page refreshes/abandoned pages
// todo: pattern to detect:back tapping
// todo: pattern to detect:unresponsive UI/gestures
// todo: pattern to detect:aborted operations

}

class FrustrationOccurence {
  String type;
  DateTime dateTime;
}
