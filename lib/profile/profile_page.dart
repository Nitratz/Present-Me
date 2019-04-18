import 'package:flutter/material.dart';
import 'package:present_me/profile/animation/profile_animations.dart';
import 'package:present_me/profile/experience/experiences_page.dart';
import 'package:present_me/utils/utils.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({@required AnimationController controller})
      : animation = new ProfileAnimation(controller);

  final ProfileAnimation animation;

  @override
  Widget build(BuildContext context) {
    return new AnimatedBuilder(
        animation: animation.controller, builder: buildContainer);
  }

  Widget buildContainer(BuildContext context, Widget child) {
    return new Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Transform(
              transform: Matrix4.diagonal3Values(
                  animation.avatarSize.value, animation.avatarSize.value, 1),
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(top: 24.0),
                height: 125.0,
                width: 125.0,
                child: ClipOval(
                  clipper: CircleClipper(),
                  child: Image.network(PICTURE_URL, fit: BoxFit.contain),
                ),
              ),
            ),

            // Name + title
            Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
                child: Text(NAME,
                    style: TextStyle(color: Colors.white, fontSize: 24)),
              ),
              Text(TITLE,
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.9), fontSize: 16))
            ]),

            // Headline + resume
            Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: Container(
                  color: Colors.white,
                  width: animation.dividerWidth.value,
                  height: 1.0,
                ),
              ),
              Text(HEADLINE,
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.9), fontSize: 16)),
              Padding(
                padding:
                    const EdgeInsets.only(top: 8.0, right: 50.0, left: 50.0),
                child: Text(RESUME,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.9), fontSize: 14)),
              )
            ]),

            Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 8.0, top: 24.0, bottom: 16.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("Experiences",
                      style: TextStyle(color: Colors.white, fontSize: 32)),
                ),
              ),
              ExperiencesPage()
            ]),

            Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 8.0, top: 8.0, bottom: 16.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("Education",
                      style: TextStyle(color: Colors.white, fontSize: 32)),
                ),
              ),
              ExperiencesPage()
            ])
          ],
        ));
  }
}
