import 'package:flutter/material.dart';

///demospaces
class SpaceModel {
  final String title;
  final String subtitle;
  final String emoji;
  final int count;
  final Color glow;

  SpaceModel({
    required this.title,
    required this.subtitle,
    required this.emoji,
    required this.count,
    required this.glow,
  });
}

final List<SpaceModel> demoSpaces = [
  SpaceModel(
    title: "After Midnight",
    subtitle: "Thoughts that come late",
    emoji: "🌑",
    count: 124,
    glow: Colors.indigoAccent,
  ),
  SpaceModel(
    title: "Unsent",
    subtitle: "Things we never said",
    emoji: "🕊",
    count: 89,
    glow: Colors.blueGrey,
  ),
  SpaceModel(
    title: "Soft Mornings",
    subtitle: "Slow beginnings",
    emoji: "🌤",
    count: 56,
    glow: Colors.orangeAccent,
  ),
  SpaceModel(
    title: "Ideas in Progress",
    subtitle: "Unfinished thoughts",
    emoji: "💡",
    count: 73,
    glow: Colors.lightBlueAccent,
  ),
  SpaceModel(
    title: "Blue Hours",
    subtitle: "Between night and day",
    emoji: "🌊",
    count: 41,
    glow: Colors.blueAccent,
  ),
  SpaceModel(
    title: "The Quiet Ones",
    subtitle: "Low voices, deep words",
    emoji: "🤍",
    count: 29,
    glow: Colors.white,
  ),
];
