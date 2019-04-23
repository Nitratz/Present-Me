import 'package:meta/meta.dart';
import 'package:present_me/profile/experience/experience_state.dart';
import 'package:present_me/profile/profile_image_state.dart';

class AppState {
  final ExperienceState expState;
  final ProfileImageState profileImageState;

  AppState({@required this.expState, @required this.profileImageState});

  factory AppState.initial() {
    return AppState(
        expState: ExperienceState.initial(),
        profileImageState: ProfileImageState.initial());
  }

  AppState copyWith({
    ExperienceState authState,
    ProfileImageState signInState,
  }) {
    return AppState(
        expState: authState ?? this.expState,
        profileImageState: signInState ?? this.profileImageState);
  }
}
