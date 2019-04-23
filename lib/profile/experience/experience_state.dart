import 'package:present_me/profile/experience/model/experiences.dart';

class ExperienceState {
  final String status;
  final List<Experience> list;

  ExperienceState({this.status, this.list});

  ExperienceState copyWith({String status, List<Experience> list}) {
    return new ExperienceState(
        status: status ?? this.status, list: list ?? this.list);
  }

  factory ExperienceState.initial() =>
      ExperienceState(status: "", list: List());
}
