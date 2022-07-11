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
  bool nameHasValue = false;
  bool sharesHasValue = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          decoration: constants.backgroundGradientStyle,
          child: ListView(
            children: [
              SizedBox(height: size.height * 0.04),
              Center(
                child: Text(
                  "Who are you transfering shares to?",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(fontWeight: FontWeight.normal),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.03, horizontal: size.width * 0.2),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white.withOpacity(0.1)),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    onChanged: (text) => setState(() {
                      if (text != "") {
                        nameHasValue = true;
                      } else {}
                      nameHasValue = false;
                    }),
                    controller: usernameController,
                    cursorColor: Colors.white,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Beneficial ID",
                      hintStyle:
                          TextStyle(color: Colors.white.withOpacity(0.3)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.04),
              Center(
                child: Text("How many shares are you willing to transfer?",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(fontWeight: FontWeight.normal)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.03, horizontal: size.width * 0.2),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white.withOpacity(0.1)),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    onChanged: (text) => setState(() {
                      if (text != "") {
                        sharesHasValue = true;
                      } else {}
                      sharesHasValue = false;
                    }),
                    controller: sharesController,
                    cursorColor: Colors.white,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "0",
                      hintStyle:
                          TextStyle(color: Colors.white.withOpacity(0.3)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              SecondaryButton(title: "Transfer", onPressed: () {})
            ],
          ),
        ));
  }
}
