import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wallet_template/components/buttons.dart';
import '../../constants.dart' as constants;

class TransferScreen extends StatefulWidget {
  const TransferScreen({Key? key}) : super(key: key);

  @override
  State<TransferScreen> createState() => _TransferScreen();
}

class _TransferScreen extends State<TransferScreen>
    with WidgetsBindingObserver {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController sharesController = TextEditingController();
  double totalPay2 = 0.00;
  bool nameHasValue = false;
  bool sharesHasValue = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                      color: Colors.grey[850]),
                  padding: const EdgeInsets.all(15),
                  height: 250,
                  width: 250,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Transfer",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  color: HexColor(constants.primaryColor),
                                  fontWeight: FontWeight.normal),
                        ),
                        SizedBox(height: size.height * 0.03),
                        Icon(
                          Icons.verified_rounded,
                          color: HexColor(constants.primaryColor),
                          size: size.width * 0.2,
                        ),
                        SizedBox(height: size.height * 0.03),
                        Text(
                          "Completed",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  color: HexColor(constants.primaryColor),
                                  fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
    }

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            "Transfer Shares",
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
              setState(() {});
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Container(
          decoration: constants.backgroundGradientStyle,
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05, vertical: size.width * 0.1),
                child: Text(
                  "Who are you transfering shares to?",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(fontWeight: FontWeight.normal),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
                child: Container(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                  child: TextFormField(
                    onChanged: (text) => setState(() {
                      if (text != "") {
                        nameHasValue = true;
                      } else {
                        nameHasValue = false;
                      }
                    }),
                    controller: usernameController,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: "beneficial ID",
                      border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                child: Column(children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'OR',
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Container(
                    decoration: BoxDecoration(
                      color: HexColor(constants.backgroundColor),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.1,
                        vertical: size.height * 0.015),
                    width: size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Scan QR code   "),
                        Icon(Icons.qr_code_2_outlined)
                      ],
                    ),
                  )
                ]),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05, vertical: size.width * 0.1),
                child: Text("How many shares are you willing to transfer?",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        ?.copyWith(fontWeight: FontWeight.normal)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
                child: Container(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                  child: TextFormField(
                    onChanged: (text) => setState(() {
                      if (text != "") {
                        sharesHasValue = true;
                      } else {
                        sharesHasValue = false;
                      }
                    }),
                    controller: sharesController,
                    cursorColor: Colors.white,
                    style: TextStyle(color: HexColor(constants.primaryColor)),
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
              SizedBox(
                height: size.height * 0.1,
              ),
              WhiteButton(title: "Transfer", onPressed: () {})
            ],
          ),
        ));
  }
}
