import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart' as constants;

class AppTheme {
  static bool isLightTheme = true;

  static ThemeData getTheme() {
    if (isLightTheme) {
      return lightTheme();
    } else {
      return darkTheme();
    }
  }

  static TextTheme _buildTextTheme(TextTheme base) {
    return base.copyWith(
      headline6: GoogleFonts.poppins(
          textStyle: TextStyle(
              color: base.headline6!.color,
              fontSize: 20,
              fontWeight: FontWeight.w500)),
      subtitle1: GoogleFonts.ubuntu(
          textStyle: TextStyle(color: base.subtitle1!.color, fontSize: 18)),
      subtitle2: GoogleFonts.ubuntu(
          textStyle: TextStyle(
              color: base.subtitle2!.color,
              fontSize: 14,
              fontWeight: FontWeight.w500)),
      bodyText2: GoogleFonts.nunito(
          textStyle: TextStyle(
        color: base.bodyText2!.color,
        fontSize: 18,
        // fontWeight: FontWeight.w700
      )),
      bodyText1: GoogleFonts.nunito(
          textStyle: TextStyle(color: base.bodyText1!.color, fontSize: 16)),
      button: GoogleFonts.poppins(
          textStyle: TextStyle(
              color: base.button!.color,
              fontSize: 14,
              fontWeight: FontWeight.w500)),
      caption: GoogleFonts.nunito(
          textStyle: TextStyle(color: base.caption!.color, fontSize: 16)),
      headline4: GoogleFonts.poppins(
          textStyle: TextStyle(color: base.headline4!.color, fontSize: 34)),
      headline3: GoogleFonts.poppins(
          textStyle: TextStyle(color: base.headline3!.color, fontSize: 48)),
      headline2: GoogleFonts.poppins(
          textStyle: TextStyle(color: base.headline2!.color, fontSize: 60)),
      headline1: GoogleFonts.poppins(
          textStyle: TextStyle(color: base.headline1!.color, fontSize: 96)),
      headline5: GoogleFonts.poppins(
          textStyle: TextStyle(color: base.headline5!.color, fontSize: 24)),
      overline: GoogleFonts.nunito(
          textStyle: TextStyle(color: base.overline!.color, fontSize: 10)),
    );
  }

  static ThemeData lightTheme() {
    Color primaryColor = HexColor(constants.primaryColor);
    Color secondaryColor = HexColor(constants.backgroundColor);
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    );

    final ThemeData base = ThemeData.light();
    return base.copyWith(
        appBarTheme: const AppBarTheme(
          color: Colors.white,
        ),
        popupMenuTheme: const PopupMenuThemeData(color: Colors.white),
        primaryColor: primaryColor,
        splashColor: Colors.white.withOpacity(0.1),
        hoverColor: Colors.transparent,
        splashFactory: InkRipple.splashFactory,
        highlightColor: Colors.transparent,
        canvasColor: HexColor('#1A1F30'),
        scaffoldBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        errorColor: HexColor("#CA443C"),
        textTheme: _buildTextTheme(base.textTheme),

        // buttonTheme: _buttonThemeData(colorScheme),
        // dialogTheme: _dialogTheme(),
        // cardTheme: _cardTheme(),
        platform: TargetPlatform.iOS,
        indicatorColor: primaryColor,
        disabledColor: HexColor("#D5D7D8"),
        colorScheme: colorScheme.copyWith(secondary: HexColor("#48BF84")));
  }

  static ThemeData darkTheme() {
    Color primaryColor = HexColor(constants.primaryColor);
    Color secondaryColor = HexColor(constants.backgroundColor);
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    );
    final ThemeData base = ThemeData.dark();
    return base.copyWith(
      popupMenuTheme: const PopupMenuThemeData(color: Colors.black),
      appBarTheme: const AppBarTheme(color: Colors.black),
      dividerColor: HexColor("#F1F1F1"),
      primaryColor: primaryColor,
      indicatorColor: Colors.white,
      splashColor: Colors.white,
      splashFactory: InkRipple.splashFactory,
      canvasColor: Colors.white,
      backgroundColor: Colors.grey[850],
      scaffoldBackgroundColor: Colors.grey[450],
      buttonTheme: ButtonThemeData(
        colorScheme: colorScheme,
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: _buildTextTheme(base.textTheme),
      platform: TargetPlatform.iOS,
      colorScheme: colorScheme.copyWith(secondary: secondaryColor),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class RadiantGradientMask extends StatelessWidget {
  const RadiantGradientMask({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const RadialGradient(
        center: Alignment.topRight,
        radius: 0.5,
        colors: [
          Color.fromRGBO(112, 68, 191, 0.9),
          Color.fromRGBO(39, 255, 255, 0.9)
        ],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}
