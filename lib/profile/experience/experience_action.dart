import 'package:present_me/profile/experience/model/experiences.dart';

class GetExperiencesAction {
  final String status;
  final List<Experience> list;

  GetExperiencesAction(this.status, this.list);
}

class AddExperiencesAction {
  final Experience exp;

  AddExperiencesAction(this.exp);
}