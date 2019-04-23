import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:present_me/profile_page.dart';
import 'package:present_me/redux/app_state.dart';
import 'package:present_me/utils/utils.dart';
import 'package:redux/redux.dart';

void main() {
  final Store<AppState> store = Store<AppState>(
    appReducer, /* Function defined in the reducers file */
    initialState: AppState.initial(),
    middleware: createStoreMiddleware(),
  );
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: ProfilePage());
  }
}

/*class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    timeDilation = 3;
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [const Color(0xff5f2c82), const Color(0xff49a09d)],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Center(
        child: Container(
          height: 125.0,
          width: 125.0,
          child: ClipOval(
              clipper: CircleClipper(),
              child: Hero(
                  transitionOnUserGestures: true,
                  tag: HERO_PROFILE_PIC,
                  child: Image.network(PICTURE_URL, fit: BoxFit.cover))),
        ),
      ),
    );
  }
}*/
