import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GenericProgressIndicator extends StatelessWidget {
  const GenericProgressIndicator({
    Key? key,
    this.strokeWidth,
    this.valueColor,
  }) : super(key: key);
  final double? strokeWidth;
  final Color? valueColor;
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      // backgroundColor: valueColor,
      strokeWidth: strokeWidth ?? 4,
      valueColor: AlwaysStoppedAnimation<Color>(
          valueColor ?? Theme.of(context).primaryColor),
    ); // TODO(v): Waiting Flutter solution to CupertinoActivityIndicator color...
    // return Platform.isIOS
    //     ? CupertinoTheme(
    //         data: CupertinoTheme.of(context).copyWith(primaryColor: Theme.of(context).primaryColor),
    //         child: CupertinoActivityIndicator(),
    //       )
    //     : CircularProgressIndicator(
    //         strokeWidth: strokeWidth,
    //       );
  }
}
