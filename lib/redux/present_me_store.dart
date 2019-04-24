import 'package:present_me/profile/experience/redux/experience_middleware.dart';
import 'package:present_me/redux/app_reducer.dart';
import 'package:present_me/redux/app_state.dart';
import 'package:redux/redux.dart';

Future<Store<AppState>> createStore() async {
  return Store(
    appReducer,
    initialState: AppState.initial(),
    middleware: [
      ExperienceMiddleware(),
    ],
  );
}