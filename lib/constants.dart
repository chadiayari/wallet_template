import 'package:flutter/cupertino.dart';

var backgroundColor = '#0E030';
var primaryColor = '#dc965a';
var primaryBlue = '#005676';
var primaryOrange = '#000';
var priaryYellow = '#000';

BoxDecoration backgroundGradientStyle = const BoxDecoration(
    gradient: LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  stops: [0.5, 1],
  colors: <Color>[
    Color(0xFF303030),
    Color.fromARGB(255, 64, 68, 82),
  ],
));
