import 'dart:convert';

import 'package:present_me/profile/experience/redux/experience_action.dart';
import 'package:present_me/profile/experience/model/experiences.dart';
import 'package:present_me/redux/app_state.dart';
import 'package:present_me/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:redux/redux.dart';

class ExperienceMiddleware extends MiddlewareClass<AppState>{

  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    if(action is GetExperiencesAction){
      getExperience(action.url, next);
    }
    else
      next(action);
  }

  void getExperience(String url, NextDispatcher next) async {
    var res = await http.get(EXPERIENCES_URL, headers: {"Accept": "application/json"});
    var jsonObj = json.decode(res.body);

    var list = jsonObj['experiences'] as List;
    List<Experience> expList = list.map((exp) => Experience.fromJson(exp)).toList();

    next(new GetExperiencesAction(url, jsonObj['status'], expList));
  }
}