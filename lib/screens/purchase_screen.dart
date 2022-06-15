import 'package:wallet_template/models/login_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../constants.dart' as constants;
import '../widgets/loading.dart';
import 'dashboard_screen.dart';

class PurchaseScreen extends StatefulWidget {
  const PurchaseScreen({Key? key}) : super(key: key);

  @override
  _PurchaseScreen createState() => _PurchaseScreen();
}

class _PurchaseScreen extends State<PurchaseScreen>
    with WidgetsBindingObserver {
  final TextEditingController sharesController = TextEditingController();
  double totalPay2 = 0.00;
  double shareValue = 10.00;
  bool hasValue = false;

  LoggedInUser userData = LoggedInUser();

  loading() {
    Loader.show(
      context,
      isAppbarOverlay: true,
      isBottomBarOverlay: true,
      progressIndicator: const Load(),
    );
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
              color: HexColor(constants.primaryRed),
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
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05, vertical: size.width * 0.1),
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
                        totalPay2 = totalPay2 + double.parse(text);
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Column(children: [
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
                      "$totalPay2 AED",
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          color: HexColor(constants.primaryRed),
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              Center(
                child: Text(
                    "This amount includes 200.00AED for sybscription fees.",
                    style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.normal)),
              ),
              SizedBox(
                height: size.height * 0.2,
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
                    onPressed: !(hasValue)
                        ? null
                        : () async {
                            setState(() {
                              loading();
                            });
                            Map data = {
                              "projectId": "6266c9ba9ff236c85096019e",
                              "numberOfShares": sharesController.text,
                            };

                            try {
                              Loader.hide();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('Purchased shares successfully'),
                                ),
                              );
                            } catch (error) {
                              Loader.hide();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Error purchasing shares'),
                                ),
                              );
                            }
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const DashboardScreen()));
                          },
                  )),
            ],
          ),
        ));
  }
}
