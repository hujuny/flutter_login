import 'package:flutter/material.dart';

enum FollowTheLeaderId { leader, follower }

class FollowTheLeader extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    Size leaderSize = Size.zero;
    if (hasChild(FollowTheLeaderId.leader)) {
      leaderSize =
          layoutChild(FollowTheLeaderId.leader, BoxConstraints.loose(size));
      positionChild(FollowTheLeaderId.leader, Offset.zero);
    }
    if (hasChild(FollowTheLeaderId.follower)) {
      Size followerSize =
          layoutChild(FollowTheLeaderId.follower, BoxConstraints.loose(size));
      positionChild(
          FollowTheLeaderId.follower,
          Offset(size.width - followerSize.width,
              size.height - followerSize.height));
    }
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) => false;
}
