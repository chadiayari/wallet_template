import 'package:wallet_template/screens/sign_screens/signup_screen.dart';
import 'package:wallet_template/components/buttons.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../components/input_field.dart';
import '../../constants.dart' as constants;
import '../../constants.dart';
import '../dashboard_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreen();
}

class _WelcomeScreen extends State<WelcomeScreen> with WidgetsBindingObserver {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool emailHasValue = false;
  bool passwordHasValue = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: backgroundGradientStyle,
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.1,
                ),
                SizedBox(
                  height: size.height * 0.15,
                  child: Text(
                    "Wallet Template",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: HexColor(constants.secondaryColor),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                LoginInputField(
                  hintText: "Enter Username",
                  onPressed: () {},
                  inputController: emailController,
                  onChanged: (text) => setState(() {
                    if (text != "") {
                      emailHasValue = true;
                    } else {
                      emailHasValue = false;
                    }
                  }),
                  pwd: false,
                ),
                LoginInputField(
                  hintText: "Enter Password",
                  onPressed: () {},
                  inputController: passwordController,
                  onChanged: (text) => setState(() {
                    if (text != "") {
                      passwordHasValue = true;
                    } else {
                      passwordHasValue = false;
                    }
                  }),
                  pwd: true,
                ),
                SizedBox(height: size.height * 0.02),
                MainButton(
                    title: "Sign In",
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const DashboardScreen()));
                    }),
                SecondaryButton(
                    title: "Sign Up",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SignupScreen()));
                    }),
                SizedBox(height: size.height * 0.07),
                Text(
                  "Copyright © 2022 Wallet Template",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.normal),
                ),
                SizedBox(height: size.height * 0.01),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
