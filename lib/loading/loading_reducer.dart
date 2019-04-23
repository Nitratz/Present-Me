import 'package:present_me/loading/loading_action.dart';
import 'package:present_me/loading/loading_state.dart';
import 'package:redux/redux.dart';

final loadingReducer = combineReducers<LoadingState>([
  TypedReducer<LoadingState, LoadingAction>(_setLoadingState),
]);

LoadingState _setLoadingState(LoadingState state, LoadingAction action) {
  return state.copyWith(isLoading: action.loading);
}
