import 'package:wallet_template/components/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../constants.dart' as constants;

class ContactSupport extends StatefulWidget {
  const ContactSupport({Key? key}) : super(key: key);

  @override
  State<ContactSupport> createState() => _ContactSupport();
}

class _ContactSupport extends State<ContactSupport>
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
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Text(
              "Contact Support",
              style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: HexColor(constants.primaryColor),
                  fontWeight: FontWeight.normal),
            ),
            SizedBox(height: size.width * 0.1),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("You can contact us through"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.2,
                  top: size.width * 0.02,
                  bottom: size.width * 0.01),
              child: Row(
                children: [
                  const Icon(Icons.phone),
                  SizedBox(width: size.width * 0.02),
                  const Text("+97124103535")
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.2,
                  top: size.width * 0.02,
                  bottom: size.width * 0.01),
              child: Row(
                children: [
                  const Icon(FontAwesomeIcons.whatsapp),
                  SizedBox(width: size.width * 0.02),
                  const Text("+97124103535")
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.2,
                  top: size.width * 0.02,
                  bottom: size.width * 0.01),
              child: Row(
                children: [
                  const Icon(Icons.email_outlined),
                  SizedBox(width: size.width * 0.02),
                  const Text("info@abudhabicc.ae")
                ],
              ),
            ),
            SizedBox(height: size.width * 0.03),
            Padding(
              padding: EdgeInsets.only(left: 20.0, bottom: size.width * 0.02),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("Work hours"),
              ),
            ),
            Center(
              child: Text(
                "Mon - Fri: 9:00am - 4:00pm",
                style: TextStyle(color: HexColor(constants.primaryBlue)),
              ),
            ),
            const Spacer(),
            RedButton(
                title: "Close",
                onPressed: () {
                  Navigator.pop(context);
                }),
            SizedBox(height: size.width * 0.2),
          ],
        ),
      ),
    );
  }
}
