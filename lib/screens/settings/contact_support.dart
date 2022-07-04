import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../components/home_widget.dart';
import '../../constants.dart' as constants;
import '../../constants.dart';

class ContactSupport extends StatefulWidget {
  const ContactSupport({Key? key}) : super(key: key);

  @override
  State<ContactSupport> createState() => _ContactSupport();
}

class _ContactSupport extends State<ContactSupport>
    with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Contact Support",
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
            SizedBox(height: size.height * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05, vertical: size.height * 0.04),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "27/7 Customer Service",
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
            Row(
              children: [
                ContactWidget(title: "Call us", onPressed: () {}),
                ContactWidget(title: "Text us", onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
