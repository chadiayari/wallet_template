import 'dart:ui';
import 'package:wallet_template/screens/sign_screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../constants.dart' as constants;

class PayementScreen extends StatefulWidget {
  const PayementScreen({Key? key}) : super(key: key);

  @override
  State<PayementScreen> createState() => _PayementScreen();
}

class _PayementScreen extends State<PayementScreen>
    with WidgetsBindingObserver {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool passwordHasValue = false;
  bool emailHasValue = false;
  String amount = "0";

  payPopup() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: AlertDialog(
              backgroundColor: Colors.transparent,
              content: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: HexColor(constants.primaryColor)),
                padding: const EdgeInsets.all(15),
                height: 250,
                width: 250,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.check_circle,
                        color: Colors.white,
                        size: 55,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Payement Success",
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MaterialButton(
                          minWidth: 20,
                          height: 20,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Continue",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: HexColor(constants.primaryColor)),
                                ),
                              ]),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const SigninScreen()));
                          }),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
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
          decoration: const BoxDecoration(color: Colors.white),
          child: ListView(
            children: [
              Column(
                children: [
                  Text(
                    "Payement",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: HexColor(constants.primaryColor),
                        fontWeight: FontWeight.normal),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.07, top: size.width * 0.1),
                      child: Text(
                        "Sender",
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: HexColor(constants.primaryColor),
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(size.width * 0.05),
                    margin: EdgeInsets.only(
                        left: size.width * 0.05,
                        right: size.width * 0.05,
                        top: size.width * 0.02),
                    decoration: BoxDecoration(
                      color: HexColor(constants.backgroundColor),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                const Text(
                                  "Amount to pay",
                                ),
                                Text(
                                  amount.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                          color:
                                              HexColor(constants.primaryColor),
                                          fontWeight: FontWeight.normal),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: size.width * 0.04),
                        const Text("Enter your username"),
                        TextFormField(
                          onChanged: (text) => setState(() {
                            if (text != "") {
                              emailHasValue = true;
                            } else {
                              emailHasValue = false;
                            }
                          }),
                          controller: userNameController,
                          cursorColor: HexColor(constants.primaryColor),
                          style: TextStyle(
                              color: HexColor(constants.primaryColor)),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: HexColor(constants.primaryColor)),
                            ),
                            hintText: "Example_01",
                            hintStyle:
                                TextStyle(color: Colors.black.withOpacity(0.3)),
                          ),
                        ),
                        SizedBox(height: size.width * 0.06),
                        const Text("Enter your password"),
                        TextFormField(
                          onChanged: (text) => setState(() {
                            if (text != "") {
                              passwordHasValue = true;
                            } else {
                              passwordHasValue = false;
                            }
                          }),
                          controller: passwordController,
                          cursorColor: HexColor(constants.primaryColor),
                          style: TextStyle(
                              color: HexColor(constants.primaryColor)),
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: HexColor(constants.primaryColor)),
                            ),
                            hintText: "******",
                            hintStyle:
                                TextStyle(color: Colors.black.withOpacity(0.3)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.07, top: size.width * 0.1),
                      child: Text(
                        "Receiver",
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: HexColor(constants.primaryColor),
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(size.width * 0.1),
                    width: size.width * 0.3,
                    height: size.width * 0.3,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage('assets/images/logo.png'),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
                    child: MaterialButton(
                        minWidth: size.width * 0.4,
                        height: 50,
                        color: (passwordHasValue && emailHasValue)
                            ? HexColor(constants.primaryColor)
                            : HexColor(constants.primaryColor).withOpacity(0.3),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Text(
                                "Pay Now",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                            ]),
                        onPressed: () {
                          payPopup();
                        }),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
