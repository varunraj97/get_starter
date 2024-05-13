import 'package:flutter/widgets.dart';

enum DeviceTypes { Phone, Tablet }

DeviceTypes getDeviceType() {
  final data = MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.first);
  return data.size.shortestSide < 600 ? DeviceTypes.Phone : DeviceTypes.Tablet;
}
