import 'package:wallet_template/components/buttons.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../constants.dart' as constants;
import '../../constants.dart';

class TermsConditions extends StatefulWidget {
  const TermsConditions({Key? key}) : super(key: key);

  @override
  State<TermsConditions> createState() => _TermsConditions();
}

enum SingingCharacter { english, arabic }

class _TermsConditions extends State<TermsConditions>
    with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Terms and conditions",
          style: Theme.of(context).textTheme.headline5!.copyWith(
              color: HexColor(constants.secondaryColor),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: HexColor(constants.secondaryColor),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        decoration: backgroundGradientStyle,
        child: ListView(
          children: [
            SizedBox(height: size.width * 0.1),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.04, right: size.width * 0.04),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text(
                    "- Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
              ),
            ),
            SizedBox(height: size.width * 0.1),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.04, right: size.width * 0.04),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text(
                    "- Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
              ),
            ),
            SizedBox(height: size.width * 0.1),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  const Icon(Icons.dangerous_outlined),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.04, right: size.width * 0.04),
                      child: const Text(
                          "You already agreed to these terms while signing up to our application."),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.width * 0.35),
            RedButton(
                title: "Close",
                onPressed: () {
                  Navigator.pop(context);
                }),
            SizedBox(height: size.width * 0.1),
          ],
        ),
      ),
    );
  }
}
