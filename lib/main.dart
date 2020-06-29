import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:flutter_instagram_clone/provider/profile.dart';

import 'model/profile.dart';

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
        title: Text('Instagram Clone'),
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

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserModel user;
  List<PostModel> posts;

  @override
  void initState() {
    downloadUserProfile().then((profile) {
      setState(() {
        this.user = profile.user;
        this.posts = profile.posts;
      });
    });
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

  Widget profileHeader() {
    if (user == null) return SliverToBoxAdapter(child: Container());

    final List<String> labels = ["posts", "followers", "following"];

    final List<String> values = [
      user.numPosts.toString(),
      user.numFollowers.toString(),
      user.numFollowing.toString()
    ];

    return SliverToBoxAdapter(
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
                        backgroundImage: NetworkImage(user.imageUrl)),
                    SizedBox(width: 20),
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                          Text(
                            "@${user.username}",
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
                Text(user.fullname,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 3),
                Text(user.bio),
                FlatButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {},
                  child: Text(
                    user.link,
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
                            Text(values[index],
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 3),
                            Text(labels[index],
                                style: TextStyle(color: Colors.black54)),
                          ])))))),
        ],
      ),
    );
  }

  Widget photoGrid() => SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        delegate: SliverChildListDelegate(List.generate(
            posts?.length ?? 0,
            (index) => Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(posts[index].imageUrl),
                    fit: BoxFit.cover,
                  )),
                ))),
      );
}
