import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';

class NavigatorPushed extends StatefulWidget {
  final dynamic navigateAfterSeconds;
  final int milliseconds;
  NavigatorPushed({this.navigateAfterSeconds, this.milliseconds});
  @override
  _NavigatorPushedState createState() => _NavigatorPushedState();
}

class _NavigatorPushedState extends State<NavigatorPushed> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: widget.milliseconds), () {
      if (widget.navigateAfterSeconds is String) {
        if (!mounted) return;
        Navigator.of(context).pushNamedAndRemoveUntil(
          widget.navigateAfterSeconds,
          (Route<dynamic> route) => false,
        );
      } else if (widget.navigateAfterSeconds is Widget) {
        if (!mounted) return;
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => widget.navigateAfterSeconds),
          (Route<dynamic> route) => false,
        );
      } else {
        throw new ArgumentError(
            'widget.navigateAfterSeconds must either be a String or Widget');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }
}
