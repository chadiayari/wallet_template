import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../constants.dart' as constants;

class RedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const RedButton({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
      child: MaterialButton(
          minWidth: size.width * 0.4,
          height: 50,
          color: HexColor(constants.primaryRed),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white),
                ),
              ]),
          onPressed: onPressed),
    );
  }
}

class IconRedButton extends StatelessWidget {
  final Icon iconName;
  final String title;
  final VoidCallback onPressed;
  const IconRedButton(
      {Key? key,
      required this.iconName,
      required this.title,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MaterialButton(
            height: 50,
            color: HexColor(constants.primaryRed),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  iconName,
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                ]),
            onPressed: onPressed),
      ],
    );
  }
}

class WhiteButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const WhiteButton({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
      child: MaterialButton(
          minWidth: size.width * 0.4,
          height: 50,
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side:
                  BorderSide(width: 1, color: HexColor(constants.primaryRed))),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: HexColor(constants.primaryRed)),
                ),
              ]),
          onPressed: onPressed),
    );
  }
}

class IconWhiteButton extends StatelessWidget {
  final Icon iconName;
  final String title;
  final VoidCallback onPressed;
  const IconWhiteButton(
      {Key? key,
      required this.iconName,
      required this.title,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        height: 50,
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(width: 1, color: HexColor(constants.primaryRed))),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          iconName,
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: HexColor(constants.primaryRed)),
          ),
        ]),
        onPressed: onPressed);
  }
}

class SmallIconWhiteButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const SmallIconWhiteButton(
      {Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        height: 25,
        minWidth: 10,
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(width: 1, color: HexColor(constants.primaryRed))),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 10,
                color: HexColor(constants.primaryRed)),
          ),
        ]),
        onPressed: onPressed);
  }
}
