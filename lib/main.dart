import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:present_me/profile_page.dart';
import 'package:present_me/redux/app_state.dart';
import 'package:present_me/redux/present_me_store.dart';
import 'package:redux/redux.dart';

void main() async {
  var store = await createStore();
  runApp(MyApp(store));
}

class MyApp extends StatefulWidget {
  final Store<AppState> store;

  MyApp(this.store);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: widget.store,
        child: MaterialApp(
            debugShowCheckedModeBanner: false, home: ProfilePage()));
  }
}
