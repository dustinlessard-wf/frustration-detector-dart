import 'dart:html';

import 'package:rxdart/rxdart.dart';

class FrustrationDetector {
  FrustrationDetector() {
    // pattern to detect: rage clicking, 3 clicks within 750ms
    final rageClickPeriod =
        Stream<dynamic>.periodic(const Duration(milliseconds: 750));
    window.document.onClick.buffer(rageClickPeriod).listen((clicks) {
      if (clicks.length >= 3) {
        print('rage clicks');
      } else {
        print('nothing to do here');
      }
    });

    // pattern to detect: erratic mouse movements, rapid changes in direction
    // Detect changes
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
