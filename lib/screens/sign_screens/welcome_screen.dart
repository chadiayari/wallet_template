import 'package:wallet_template/screens/sign_screens/signin_screen.dart';
import 'package:wallet_template/screens/sign_screens/singup_screen.dart';
import 'package:wallet_template/components/buttons.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../constants.dart' as constants;

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreen();
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Welcome to",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: HexColor(constants.primaryColor),
                fontWeight: FontWeight.normal),
          ),
          SizedBox(height: size.height * 0.03),
          SizedBox(
            width: size.width * 0.9,
            child: Center(
              child: Text(
                "Wallet Template",
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: HexColor(constants.primaryColor),
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
