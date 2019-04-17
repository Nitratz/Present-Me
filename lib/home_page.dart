import 'package:flutter/material.dart';
import 'package:present_me/utils/my_fonts_icons.dart';
import 'package:present_me/profile/profile_page.dart';
import 'package:present_me/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [const Color(0xff5f2c82), const Color(0xff49a09d)],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: new AppBar(
            actions: <Widget>[
              IconButton(
                  icon: Icon(MyFonts.linkedin),
                  onPressed: () => {browseTo(LINKEDIN_PROFILE)}),
              IconButton(
                  icon: Icon(MyFonts.github),
                  onPressed: () => {browseTo(GITHUB_PROFILE)})
            ],
            centerTitle: true,
            title: new Text("Present Me", style: TextStyle(fontSize: 32, fontFamily: 'FredokaOne'),),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: ProfilePage(),
        ),
      ],
    );
  }
}

browseTo(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  }
}

