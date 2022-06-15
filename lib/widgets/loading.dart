import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import '../../constants.dart' as constants;

import 'package:hexcolor/hexcolor.dart';

import '../components/buttons.dart';

class Load extends StatelessWidget {
  const Load({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
            child: Image.asset(
              "assets/images/loading.gif",
              height: 125.0,
              width: 125.0,
            ),
          ),
        ),
      ],
    );
  }
}

class HomeLoad extends StatelessWidget {
  const HomeLoad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: size.height * 0.35,
          decoration: BoxDecoration(
            color: HexColor(constants.backgroundColor),
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100)),
          ),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.03),
              Text(
                "You own",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.black, fontWeight: FontWeight.normal),
              ),
              SizedBox(height: size.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "...",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    " Shares",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.06),
              Row(
                children: [
                  const Spacer(),
                  IconWhiteButton(
                      iconName: Icon(Icons.arrow_downward,
                          color: HexColor(constants.primaryRed)),
                      title: "Purchase",
                      onPressed: () {}),
                  SizedBox(width: size.width * 0.05),
                  IconRedButton(
                      iconName: const Icon(
                        Icons.arrow_upward,
                        color: Colors.white,
                      ),
                      title: "Transfer",
                      onPressed: () {}),
                  const Spacer(),
                ],
              ),
            ],
          ),
        ),
        BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
            child: Center(
              child: Image.asset(
                "assets/images/loading.gif",
                height: 125.0,
                width: 125.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class NotificationsLoad extends StatelessWidget {
  const NotificationsLoad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
            child: Center(
              child: Image.asset(
                "assets/images/loading.gif",
                height: 125.0,
                width: 125.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
