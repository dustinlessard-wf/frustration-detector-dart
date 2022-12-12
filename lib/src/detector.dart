import 'dart:html';

import 'package:rxdart/rxdart.dart';

class Detector {
  Detector() {
    // todo: pattern to detect: rage clicking, 3 clicks within 750ms
    // reference : https://help.piwik.pro/support/collecting-data/rage-clicks-error-clicks-dead-clicks-and-mouse-shakes/
    final rawMouseClicks = Observable(window.document.onClick);
    rawMouseClicks
      ..buffer(onTime(const Duration(milliseconds: 750))).listen((clicks) {
        if (clicks.length >= 3) {
          print('rage clicks');
        } else {
          print('nothing to do here');
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
