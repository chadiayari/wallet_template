import 'package:wallet_template/screens/sign_screens/signin_screen.dart';
import 'package:wallet_template/screens/sign_screens/singup_screen.dart';
import 'package:wallet_template/components/buttons.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../constants.dart' as constants;

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreen createState() => _WelcomeScreen();
}

class _WelcomeScreen extends State<WelcomeScreen> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: HexColor(constants.backgroundColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: size.height * 0.3,
            decoration: BoxDecoration(
              image: const DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage("assets/images/mainimage.jpg")),
              color: HexColor(constants.primaryRed),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(150),
                  bottomRight: Radius.circular(150)),
            ),
          ),
          SizedBox(height: size.height * 0.1),
          Text(
            "Welcome to",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: HexColor(constants.primaryRed),
                fontWeight: FontWeight.normal),
          ),
          SizedBox(height: size.height * 0.03),
          SizedBox(
            width: size.width * 0.9,
            child: Center(
              child: Text(
                "Abu Dhabi Community Cooperative",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: HexColor(constants.primaryRed),
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.05),
          RedButton(
              title: "Sign In",
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const SigninScreen()));
              }),
          WhiteButton(
              title: "Sign Up",
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const SignupScreen()));
              }),
          SizedBox(height: size.height * 0.07),
          Text(
            "Copyright © 2022 AbuDhabiCC",
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.black, fontWeight: FontWeight.normal),
          ),
          SizedBox(height: size.height * 0.01),
        ],
      ),
    );
  }
}
