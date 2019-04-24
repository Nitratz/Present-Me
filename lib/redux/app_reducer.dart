import 'package:present_me/profile/experience/redux/experiences_reducer.dart';
import 'package:present_me/profile/profile_redux/profile_image_reducer.dart';
import 'package:present_me/redux/app_state.dart';

AppState appReducer(AppState state, dynamic action) => new AppState(
    expState: experienceReducer(state.expState, action),
    profileImageState: profileImageReducer(state.profileImageState, action)
);
