# frustration-detector-dart
The success of any online system is dependent on delightful user experiences, free of frustrations.  End user frustration tends to manifest in some known behaviors that could be detected, measured and reported. 
This repo houses the code needed to detect user interaction patterns consistent with user frustration

Similar to how we often track end-user interactions, we could extend this instrumentation to also detect and report end-user behaviors that indicate frustration:

- rage clicking
- random clicking (clicking on non-clickable elements)
- rage scrolling
- random scrolling
- page refreshes/abandoned pages
- back tapping
- unresponsive UI/gestures
- aborted operations
- page refreshes

With this raw data, we could develop derivative insights like:

- alerts for poor user experiences; notify product managers of customers experiencing frustration when using a product and reach out to those customers proactively
- Building in platform capabilities that actively support end-users to recover from frustration-inducing situations.
    ie: End-user support agent that intervenes when frustration is detected, empathizing with the user and prompting them to report the issue leading to their frustration.
- heatmap overlays for the UI showing areas of highest user frustration; helping Product and UX improve our product
- Enhanced contextual information for those responding to operational incidents. 


## Examples

To run the examples:
```
dart pub get
webdev serve example
```