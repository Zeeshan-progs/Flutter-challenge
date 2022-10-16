import 'package:flutter/material.dart';

class DeviceUtils {
  DeviceUtils._();

  static double widget(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static Widget blankHeight(double value) => Container(height: value,);
  static Widget blankWidth(double value) => Container(width: value,);

}
