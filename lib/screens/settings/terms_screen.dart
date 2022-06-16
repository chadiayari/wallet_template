import 'package:wallet_template/components/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../constants.dart' as constants;

class TermsConditions extends StatefulWidget {
  const TermsConditions({Key? key}) : super(key: key);

  @override
  State<TermsConditions> createState() => _TermsConditions();
}

enum SingingCharacter { english, arabic }

class _TermsConditions extends State<TermsConditions>
    with WidgetsBindingObserver {
  @override
  void dispose() {
    super.dispose();
    Loader.hide();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_outlined,
            color: HexColor(constants.primaryColor),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        height: size.height,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: ListView(
          children: [
            Center(
              child: Text(
                "Terms and conditions",
                style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: HexColor(constants.primaryColor),
                    fontWeight: FontWeight.normal),
              ),
            ),
            SizedBox(height: size.width * 0.1),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.04, right: size.width * 0.04),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text(
                    "- To the members of the Abu Dhabi Community Cooperative Board of Directors, after perusal of the Articles of Association of Abu Dhabi Community Cooperative, and after carefully studying and understanding its content and accepting to abide by all its provisions. I ask you to agree to accept my membership and my request to purchase the cooperative shares, and I bear all the responsibilities arising from that. I also certify that all information in this application and accompanying supporting documents are true and complete, and I pledge that I will bear the legal consequences if they arise."),
              ),
            ),
            SizedBox(height: size.width * 0.1),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.04, right: size.width * 0.04),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text(
                    "- I acknowledge that I am aware that a member cannot own more than one-tenth of the subscribed capital of the cooperative as per Article 17 of the Articles of Association, and therefore I have no objection to adjusting the number of shares required, and any amounts returned to my aforementioned account, and the shares are credited In my approved name."),
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
