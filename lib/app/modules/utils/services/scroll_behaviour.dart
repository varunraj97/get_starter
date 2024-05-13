import 'package:flutter/material.dart';

class ScrollBehaviorModified extends ScrollBehavior {
  const ScrollBehaviorModified();
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
        return const ClampingScrollPhysics();
      case TargetPlatform.macOS:
        return const ClampingScrollPhysics();
      case TargetPlatform.android:
        return const ClampingScrollPhysics();
      case TargetPlatform.fuchsia:
        return const ClampingScrollPhysics();
      case TargetPlatform.linux:
        return const ClampingScrollPhysics();
      case TargetPlatform.windows:
        return const ClampingScrollPhysics();
    }
  }
}
