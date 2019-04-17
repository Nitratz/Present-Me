import 'dart:core';

class Experiences {
  final String status;
  final List<Experience> list;

  Experiences({this.status, this.list});

  factory Experiences.fromJson(Map<String, dynamic> json) {
    var list = json['experiences'] as List;
    List<Experience> expList =
        list.map((exp) => Experience.fromJson(exp)).toList();

    return Experiences(
      status: json['status'],
      list: expList,
    );
  }
}

class Experience {
  final String id;
  final String name;
  final String image_url;
  final String period;
  final String position;
  final List<String> tasks;

  Experience({this.id, this.name, this.image_url, this.period, this.position, this.tasks});

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
        id: json['id'],
        name: json['name'],
        image_url: json['image_url'],
        period: json['period'],
        position: json['position'],
        tasks: new List<String>.from(json['tasks']));
  }
}
