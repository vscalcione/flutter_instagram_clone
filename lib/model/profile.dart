import 'package:flutter/material.dart';


class ProfileModel {
  final UserModel user;
  final List<PostModel> posts;

  const ProfileModel({
    @required this.user,
    @required this.posts,
  });
}

class UserModel {
  final String fullname; //Bill Gates
  final String username; //@thisisbillgates
  final String imageUrl;
  final String bio;

  final String link;

  const UserModel({
    @required this.fullname,
    @required this.username,
    @required this.imageUrl,
    @required this.bio,
    @required this.link
  });
}

class PostModel {
  final String imageUrl;

  const PostModel({
    @required this.imageUrl,
  });
}
