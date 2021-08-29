import 'package:flutter/material.dart';
import 'package:vethx_beta/core/utils/logger.dart';

class LifeCycleManager extends StatefulWidget {
  final Widget child;
  final Function(AppLifecycleState)? onLifecycleStateChange;

  const LifeCycleManager({
    Key? key,
    required this.child,
    this.onLifecycleStateChange,
  }) : super(key: key);

  @override
  _LifeCycleManagerState createState() => _LifeCycleManagerState();
}

class _LifeCycleManagerState extends State<LifeCycleManager>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (widget.onLifecycleStateChange != null) {
      widget.onLifecycleStateChange!(state);
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
