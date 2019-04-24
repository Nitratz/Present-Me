import 'package:present_me/profile/experience/redux/experience_action.dart';
import 'package:present_me/profile/experience/redux/experience_state.dart';
import 'package:redux/redux.dart';

final experienceReducer = combineReducers<ExperienceState>([
  TypedReducer<ExperienceState, GetExperiencesAction>(_getExperienceState),
  TypedReducer<ExperienceState, AddExperiencesAction>(_addExperienceState),
]);

ExperienceState _getExperienceState(
    ExperienceState state, GetExperiencesAction action) {
  return state.copyWith(status: action.status, list: action.list);
}

ExperienceState _addExperienceState(
    ExperienceState state, AddExperiencesAction action) {
  return state;
}
