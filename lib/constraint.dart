import 'package:flutter/material.dart';
import 'package:tictok/Views/Widgets/add_video.dart';
import 'package:tictok/Views/Screen/display_video_screen.dart';

const backgroundcolor = Colors.black;

var buttoncolor = Colors.red[400];

const bordercolor = Colors.grey;
var pageIndex = [
  DisplayVideoScreen(),
  const Text("search"),
  const AddVideoScreen(),
  const Text("Message"),
  const Text("Profile"),
];
