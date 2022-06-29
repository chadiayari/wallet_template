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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          title: Text(
            "Fund your account",
            style: Theme.of(context).textTheme.headline5!.copyWith(
                color: HexColor(constants.primaryColor),
                fontWeight: FontWeight.normal),
          ),
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
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.03),
                child: Center(
                  child: Text(
                    "How many shares to purchase?",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.03, horizontal: size.width * 0.4),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white.withOpacity(0.1)),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    onChanged: (text) => setState(() {
                      totalPay2 = 200;
                      if (text != "") {
                        totalPay2 = totalPay2 + double.parse(text) * 10;
                        hasValue = true;
                      } else {
                        totalPay2 = 210;
                      }
                    }),
                    controller: sharesController,
                    cursorColor: Colors.white,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "1",
                      hintStyle:
                          TextStyle(color: Colors.white.withOpacity(0.3)),
                    ),
                  ),
                ),
              ),
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
                      "$totalPay2 USD",
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          color: HexColor(constants.primaryColor),
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              Text(
                '* One share costs 10.00USD.',
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(fontWeight: FontWeight.normal),
              ),
              Text("* This amount includes 200.00USD for sybscription fees.",
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
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: HexColor(constants.blue),
                          content: const Text('Payment successful'),
                        ),
                      );
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SigninScreen()));
                    }),
              ),
            ],
          ),
        ));
  }
}
