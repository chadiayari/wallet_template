import 'package:wallet_template/screens/sign_screens/payement_screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../constants.dart' as constants;

class FundScreen extends StatefulWidget {
  const FundScreen({Key? key}) : super(key: key);

  @override
  _FundScreen createState() => _FundScreen();
}

class _FundScreen extends State<FundScreen> with WidgetsBindingObserver {
  final TextEditingController sharesController = TextEditingController();
  double totalPay2 = 0.00;
  double shareValue = 10.00;
  bool hasValue = false;

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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(color: Colors.white),
          child: ListView(
            children: [
              Center(
                child: Text(
                  "Fund your account",
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: HexColor(constants.primaryRed),
                      fontWeight: FontWeight.normal),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.width * 0.05),
                child: Text(
                  "How many shares to purchase?",
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.normal),
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
                    cursorColor: Colors.black,
                    style: TextStyle(color: HexColor(constants.primaryRed)),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: "0.0",
                      border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      hintStyle:
                          TextStyle(color: Colors.black.withOpacity(0.3)),
                    ),
                  ),
                ),
              ),
              Column(children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '* One share costs 10.00AED.',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.normal),
                  ),
                ),
                Text(
                  'The value of the share is determined by the Board meeting at the end of each year.',
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.normal),
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
                          color: HexColor(constants.primaryRed),
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              Text("* This amount includes 200.00AED for sybscription fees.",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.normal)),
              SizedBox(
                height: size.height * 0.1,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
                child: MaterialButton(
                    minWidth: size.width * 0.4,
                    height: 50,
                    color: hasValue
                        ? HexColor(constants.primaryRed)
                        : HexColor(constants.primaryRed).withOpacity(0.3),
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
                      hasValue
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const PayementScreen()))
                          : null;
                    }),
              ),
            ],
          ),
        ));
  }
}
