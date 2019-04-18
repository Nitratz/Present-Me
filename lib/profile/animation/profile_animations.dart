import 'package:flutter/material.dart';

class ProfileAnimation {
  ProfileAnimation(this.controller)
      : avatarSize = new Tween(begin: 0.0, end: 1.0).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.800,
              1.000,
              curve: Curves.elasticOut,
            ),
          ),
        ),
        dividerWidth = new Tween(begin: 0.0, end: 280.0).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.800,
              1.000,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        );

  final AnimationController controller;
  final Animation<double> avatarSize;
  final Animation<double> dividerWidth;
}
