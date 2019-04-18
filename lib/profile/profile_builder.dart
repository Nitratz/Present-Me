import 'package:flutter/material.dart';
import 'package:present_me/profile/animation/profile_animations.dart';
import 'package:present_me/profile/experience/experiences_carousel.dart';
import 'package:present_me/utils/utils.dart';

class ProfileBuilder extends StatefulWidget {
  ProfileBuilder({@required AnimationController controller})
      : animation = new ProfileAnimation(controller);

  final ProfileAnimation animation;

  @override
  _ProfileBuilderState createState() => _ProfileBuilderState();
}

class _ProfileBuilderState extends State<ProfileBuilder> {
  @override
  Widget build(BuildContext context) {
    return new AnimatedBuilder(
        animation: widget.animation.controller, builder: buildContainer);
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
                  widget.animation.avatarSize.value,
                  widget.animation.avatarSize.value,
                  1),
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
            Transform.translate(
              offset: widget.animation.nameTranslate.value,
              child: Column(children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
                  child: Text(NAME,
                      style: TextStyle(
                          color: Colors.white
                              .withOpacity(widget.animation.nameOpacity.value),
                          fontSize: 24)),
                ),
                Text(TITLE,
                    style: TextStyle(
                        color: Colors.white
                            .withOpacity(widget.animation.nameOpacity.value),
                        fontSize: 16))
              ]),
            ),

            // Headline + resume
            Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: Container(
                  color: Colors.white,
                  width: widget.animation.dividerWidth.value,
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
              ExperiencesCarousel()
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
              ExperiencesCarousel()
            ])
          ],
        ));
  }

  @override
  void initState() {
    super.initState();
    new Future.delayed(Duration(milliseconds: 1500), () {
      widget.animation.controller.forward();
    });
  }
}
