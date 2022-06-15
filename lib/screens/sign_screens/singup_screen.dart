import 'package:wallet_template/screens/sign_screens/register_manually.dart';
import 'package:wallet_template/screens/sign_screens/signin_screen.dart';
import 'package:wallet_template/screens/sign_screens/verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../constants.dart' as constants;

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreen createState() => _SignupScreen();
}

class _SignupScreen extends State<SignupScreen> with WidgetsBindingObserver {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return HexColor(constants.primaryBlue);
      }
      return HexColor(constants.primaryRed);
    }

    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_outlined,
            color: HexColor(constants.primaryRed),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Text(
              "Let's get started",
              style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: HexColor(constants.primaryRed),
                  fontWeight: FontWeight.normal),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                'Connect your UAE PASS',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Colors.black, fontWeight: FontWeight.normal),
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: HexColor(constants.backgroundColor),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Row(
                children: [
                  const Spacer(),
                  Container(
                    color: const Color.fromRGBO(85, 201, 178, 1),
                    child: const Icon(Icons.fingerprint, color: Colors.white),
                  ),
                  SizedBox(
                    width: size.width * 0.04,
                  ),
                  Text(
                    "Sign up with UAE PASS",
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.normal),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.05),
            const Text("OR"),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterScreen()));
              },
              child: Text(
                "Register manually",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: HexColor(constants.primaryBlue),
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                Text(
                  'I agree to the terms and conditions and the Privacy Policy',
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.normal),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
              child: MaterialButton(
                  minWidth: size.width * 0.4,
                  height: 50,
                  color: isChecked
                      ? HexColor(constants.primaryRed)
                      : HexColor(constants.primaryRed).withOpacity(0.3),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Text(
                          "Sign up",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ]),
                  onPressed: () {
                    isChecked
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const VerifyDetails()))
                        : null;
                  }),
            ),
            SizedBox(height: size.height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  "Already have an account? ",
                  style: TextStyle(color: Colors.black),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SigninScreen()));
                  },
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: HexColor(constants.primaryBlue),
                    ),
                  ),
                )
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
