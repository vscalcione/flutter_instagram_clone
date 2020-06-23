import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:flutter_instagram_clone/provider/profile.dart';

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
      body: ProfilePage(),
      bottomNavigationBar: BottomNavigationBar(
          selectedIconTheme: IconThemeData(color: Colors.indigo),
          unselectedIconTheme: IconThemeData(color: Colors.black),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                icon: Icon(SimpleLineIcons.home), title: Text("home")),
            BottomNavigationBarItem(
                icon: Icon(Feather.search), title: Text("home")),
            BottomNavigationBarItem(
                icon: Icon(SimpleLineIcons.plus), title: Text("home")),
            BottomNavigationBarItem(
                icon: Icon(SimpleLineIcons.heart), title: Text("home")),
            BottomNavigationBarItem(
                icon: Icon(SimpleLineIcons.user), title: Text("home")),
          ]),
    );
  }
}

class ProfilePage extends StatefulWidget{
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState(){
    downloadUserProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        profileHeader(),
        photoGrid(),
      ],
    );
  }

  Widget profileHeader() => SliverToBoxAdapter(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(
                              'https://solemole.com/uploads/product/1664/66368065.jpg')
                      ),
                      SizedBox(width: 20),
                      Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                            Text(
                              "@thisisbillgates",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w300),
                            ),
                            SizedBox(height: 6),
                            MaterialButton(
                                minWidth: double.infinity,
                                height: 40,
                                color: Colors.blue.shade700,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                onPressed: () {},
                                child: Text("Segui",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13)))
                          ]))
                    ],
                  ),
                  SizedBox(height: 16),
                  Text("Bill Gates",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 3),
                  Text("This is a fucking creator of Windozoz"),
                  FlatButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {},
                    child: Text(
                      "gatesnot.es/2020AnnualLetter",
                      style: TextStyle(color: Colors.indigo.shade700),
                    ),
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  border:
                      Border(top: BorderSide(color: Colors.black26, width: 1)),
                ),
                child: Row(
                    children: List.generate(
                        3,
                        (index) => Expanded(
                                child: Container(
                                    child: Column(children: <Widget>[
                              Text("139",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 3),
                              Text("post",
                                  style: TextStyle(color: Colors.black54)),
                            ])))))),
          ],
        ),
      );

  Widget photoGrid() => SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        delegate: SliverChildListDelegate(List.generate(
            12,
            (index) => Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage("https://images.pexels.com/photos/462118/pexels-photo-462118.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                        fit: BoxFit.cover,
                  )),
                )
        )),
      );
}
