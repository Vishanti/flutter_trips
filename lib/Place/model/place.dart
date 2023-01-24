import 'package:flutter/material.dart';
import 'package:flutter_trips/User/model/user.dart';

class Place {
  String? id;
  String name;
  String description;
  String urlImage;
  int? likes;
  UserModel? userOwner;

  Place(
      {Key? key,
      required this.name,
      required this.description,
      required this.urlImage,
      this.likes,
      this.userOwner});
}
