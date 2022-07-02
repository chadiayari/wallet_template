import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../constants.dart' as constants;

class HomeWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const HomeWidget({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.5,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: MaterialButton(
          // minWidth: size.width * 0.2,
          height: 50,
          color: HexColor(constants.blue),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          onPressed: onPressed,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Colors.white),
                ),
                Icon(
                  title == "Purchase"
                      ? Icons.arrow_downward_rounded
                      : Icons.arrow_upward_rounded,
                  color: Colors.white,
                )
              ])),
    );
  }
}

class ContactWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const ContactWidget({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.5,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: MaterialButton(
          // minWidth: size.width * 0.2,
          height: 50,
          color: Colors.black38,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          onPressed: onPressed,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Colors.white),
                ),
                Icon(
                  title == "Call us" ? Icons.phone : Icons.message,
                  color: Colors.white,
                )
              ])),
    );
  }
}
