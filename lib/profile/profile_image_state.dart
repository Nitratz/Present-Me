import 'package:flutter/material.dart';

class ProfileImageState {
  final Image image;

  ProfileImageState({
    this.image,
  });

  ProfileImageState copyWith({Image image}) {
    return new ProfileImageState(
      image: image ?? this.image,
    );
  }

  factory ProfileImageState.initial() => ProfileImageState(image: Image());
}