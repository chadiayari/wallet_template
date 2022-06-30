import 'package:flutter/cupertino.dart';

var backgroundColor = '#0E030';
var primaryColor = '#59B9AF';
var secondaryColor = '#D0D5DA';
var blue = '#8A99A7';

BoxDecoration backgroundGradientStyle = const BoxDecoration(
    gradient: LinearGradient(
  begin: Alignment.bottomRight,
  end: Alignment.topLeft,
  stops: [0.5, 1],
  colors: <Color>[
    Color(0xFF303030),
    Color(0xFF4C545B),
  ],
));
