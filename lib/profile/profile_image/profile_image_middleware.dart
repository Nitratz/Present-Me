import 'package:flutter/material.dart';
import 'package:present_me/profile/profile_image_action.dart';
import 'package:present_me/redux/app_state.dart';
import 'package:redux/redux.dart';

class ProfileImageMiddleware extends MiddlewareClass<AppState> {

  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    if (action is GetProfileImageAction) {
      getProfileImage(action.link, next);
    }
    else
      next(action);
  }

   void getProfileImage(String link, NextDispatcher next) async {
    Image img = Image.network(link);
    next(new GetProfileImageAction(img, link));
  }
}