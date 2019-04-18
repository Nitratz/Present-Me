import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:present_me/profile/experience/header.dart';
import 'package:http/http.dart' as http;
import 'package:present_me/profile/experience/model/experiences.dart';
import 'package:present_me/utils/utils.dart';

class ExperiencesCarousel extends StatefulWidget {
  const ExperiencesCarousel({
    Key key,
  }) : super(key: key);

  @override
  _ExperiencesCarouselState createState() => _ExperiencesCarouselState();
}

class _ExperiencesCarouselState extends State<ExperiencesCarousel> {
  Experiences mExperiences;

  @override
  void initState() {
    super.initState();

    getExperiences();
  }

  @override
  Widget build(BuildContext context) {
    if (mExperiences == null)
      return CircularProgressIndicator();
    else
      return CarouselSlider(
        height: 250.0,
        items: mExperiences.list.map((exp) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 2.0),
                  child: buildCardExperience(exp));
            },
          );
        }).toList(),
      );
  }

  Card buildCardExperience(Experience exp) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Column(children: <Widget>[
          // Image + Title + Slogan
          HeaderExperience(mExperience: exp),
          // The experience's Period
          buildPeriod(exp),
          // Tasks
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: CustomPaint(
              painter: DrawLine(start: -100.0, end: 100.0),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: exp.tasks.length,
                itemBuilder: (context, position) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "- " + exp.tasks[position],
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  );
                }),
          )),
        ]),
      ),
    );
  }

  getExperiences() async {
    var res = await http
        .get(EXPERIENCES_URL, headers: {"Accept": "application/json"});

    setState(() {
      mExperiences = Experiences.fromJson(json.decode(res.body));
    });
  }

  Padding buildPeriod(Experience exp) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          exp.period,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
