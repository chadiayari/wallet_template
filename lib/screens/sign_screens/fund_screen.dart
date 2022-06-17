import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wallet_template/screens/sign_screens/signin_screen.dart';
import '../../constants.dart' as constants;

class FundScreen extends StatefulWidget {
  const FundScreen({Key? key}) : super(key: key);

  @override
  State<FundScreen> createState() => _FundScreen();
}

class _FundScreen extends State<FundScreen> with WidgetsBindingObserver {
  final TextEditingController sharesController = TextEditingController();
  double totalPay2 = 0.00;
  double shareValue = 10.00;
  bool hasValue = false;

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
                        color: Colors.black,
                        size: 55,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Payement Success",
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Colors.black, fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MaterialButton(
                          minWidth: 15,
                          height: 30,
                          color: Colors.black,
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              Center(
                child: Text(
                  "Fund your account",
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: HexColor(constants.primaryColor),
                      fontWeight: FontWeight.normal),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.width * 0.05),
                child: Text(
                  "How many shares to purchase?",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(fontWeight: FontWeight.normal),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.3),
                child: Container(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                  child: TextFormField(
                    onChanged: (text) => setState(() {
                      totalPay2 = 200.0;
                      if (text != "") {
                        totalPay2 = totalPay2 + double.parse(text) * 10;
                        hasValue = true;
                      } else {
                        totalPay2 = 0.0;
                        hasValue = false;
                      }
                    }),
                    controller: sharesController,
                    cursorColor: Colors.white,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: "0.0",
                      border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                  ),
                ),
              ),
              Column(children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '* One share costs 10.00AED.',
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                ),
                Text(
                  'The value of the share is determined by the Board meeting at the end of each year.',
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(fontWeight: FontWeight.normal),
                ),
              ]),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.2, vertical: size.height * 0.06),
                child: Row(
                  children: [
                    Text("Total to pay:    ",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            ?.copyWith(fontWeight: FontWeight.normal)),
                    Text(
                      "$totalPay2 AED",
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          color: HexColor(constants.primaryColor),
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              Text("* This amount includes 200.00AED for sybscription fees.",
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(fontWeight: FontWeight.normal)),
              SizedBox(
                height: size.height * 0.1,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
                child: MaterialButton(
                    minWidth: size.width * 0.4,
                    height: 50,
                    color: hasValue
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
                    onPressed: () async {
                      payPopup();
                    }),
              ),
            ],
          ),
        ));
  }
}
