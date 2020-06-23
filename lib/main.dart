import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: RootPage(),
    );
  }
}

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('@billgates'),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData(color: Colors.indigo),
        unselectedIconTheme: IconThemeData(color: Colors.black),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(SimpleLineIcons.home), title: Text("home")),
          BottomNavigationBarItem(icon: Icon(Feather.search), title: Text("home")),
          BottomNavigationBarItem(icon: Icon(SimpleLineIcons.plus), title: Text("home")),
          BottomNavigationBarItem(icon: Icon(SimpleLineIcons.heart), title: Text("home")),
          BottomNavigationBarItem(icon: Icon(SimpleLineIcons.user), title: Text("home")),
        ]
      ),
    );
  }
}
