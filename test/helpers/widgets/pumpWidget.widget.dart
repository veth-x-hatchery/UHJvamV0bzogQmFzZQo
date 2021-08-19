import 'package:flutter/material.dart';
import 'package:vethx_beta/core/consts/size_config.dart';

Builder setupToPump(Widget child) {
  return Builder(builder: (context) {
    SizeConfig().init(context);
    return child;
  });
}
