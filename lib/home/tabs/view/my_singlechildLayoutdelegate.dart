import 'package:flutter/cupertino.dart';

class MySingleChildLayoutDelegate extends SingleChildLayoutDelegate {
  final Offset position;

  MySingleChildLayoutDelegate(this.position);

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return Offset(position.dx, position.dy);
  }

  @override
  bool shouldRelayout(MySingleChildLayoutDelegate oldDelegate) {
    return oldDelegate.position != position;
  }
}
