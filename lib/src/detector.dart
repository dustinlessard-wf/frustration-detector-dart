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

    // pattern to detect: erratic back and forth mouse movements, rapid changes in direction
    var direction;
    final erraticMouseMovePeriod =
        Stream<dynamic>.periodic(const Duration(milliseconds: 250));
    window.document.onMouseMove.buffer(erraticMouseMovePeriod).listen((moves) {
      var directionChangeCount = 0;
      for (var event in moves) {
        var newDirection = event.movement.x.sign;
        if (newDirection != direction) {
          direction = newDirection;
          directionChangeCount++;
        }
      }
      if (directionChangeCount >= 4) {
        print(
            'erratic mouse movements'); // todo: need to also factor in distance and/or velocity
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
