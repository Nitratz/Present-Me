import 'package:present_me/profile/profile_image_action.dart';
import 'package:present_me/profile/profile_image_state.dart';
import 'package:redux/redux.dart';

final profileImageReducer = combineReducers<ProfileImageState>([
  TypedReducer<ProfileImageState, GetProfileImageAction>(_getProfileImageState)
]);

ProfileImageState _getProfileImageState(
    ProfileImageState state, GetProfileImageAction action) {
  return state.copyWith(image: action.image);
}
