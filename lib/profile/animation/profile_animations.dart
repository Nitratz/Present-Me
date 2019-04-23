import 'package:flutter/material.dart';

class ProfileAnimation {
  ProfileAnimation(this.controller)
      : titleFade = new Tween(begin: 0.0, end: 1.0).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.000,
              0.500,
              curve: Curves.elasticOut,
            ),
          ),
        ),

        titleTranslate =
            new Tween(begin: Offset(0, -50), end: Offset(0, 0)).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.000,
              0.500,
              curve: Curves.elasticOut,
            ),
          ),
        ),

        avatarSize = new Tween(begin: 0.0, end: 1.0).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.000,
              0.500,
              curve: Curves.elasticOut,
            ),
          ),
        ),

        nameTranslate = new Tween(begin: Offset(0, 50), end: Offset(0, 0))
            .animate(new CurvedAnimation(
                parent: controller,
                curve: new Interval(
                  0.250,
                  0.500,
                  curve: Curves.decelerate,
                ))),

        nameOpacity = new Tween(begin: 0.0, end: 1.0).animate(
            new CurvedAnimation(
                parent: controller,
                curve: new Interval(0.250, 0.500, curve: Curves.bounceInOut))),

        dividerWidth = new Tween(begin: 0.0, end: 280.0).animate(
          new CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.500,
              0.750,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        );

  final AnimationController controller;
  final Animation<double> titleFade;
  final Animation<Offset> titleTranslate;
  final Animation<double> avatarSize;
  final Animation<double> dividerWidth;
  final Animation<Offset> nameTranslate;
  final Animation<double> nameOpacity;
}
