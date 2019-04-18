import 'package:flutter/material.dart';
import 'package:present_me/profile/profile_builder.dart';

class ProfileAnimator extends StatefulWidget {
  @override
  _ArtistDetailsAnimator createState() => new _ArtistDetailsAnimator();
}

class _ArtistDetailsAnimator extends State<ProfileAnimator>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProfileBuilder(
      controller: _controller,
    );
  }
}
