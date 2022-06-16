import 'package:flutter/cupertino.dart';

var backgroundColor = '#FEF2DF';
var primaryColor = '#dc965a';
var primaryBlue = '#005676';
var primaryOrange = '#D47829';
var priaryYellow = '#FBAC30';

BoxDecoration backgroundGradientStyle = const BoxDecoration(
    gradient: LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  stops: [0.5, 1],
  colors: <Color>[
    Color(0xFF1A1F30),
    Color(0xFF0D4349),
  ],
));

String baseUrl = "https://uae-nadhir-app.herokuapp.com";
