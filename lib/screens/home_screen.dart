import 'package:wallet_template/components/buttons.dart';
import 'package:wallet_template/models/login_user.dart';
import 'package:wallet_template/screens/purchase_more_funds.dart';
import 'package:wallet_template/screens/transfer_screen.dart';
import 'package:wallet_template/widgets/dashboard_widget.dart';
import 'package:wallet_template/widgets/loading.dart';
import 'package:wallet_template/widgets/nav_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../constants.dart' as constants;
import '../models/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> with WidgetsBindingObserver {
  LoggedInUser userData = LoggedInUser();
  User currentuser = User();
  bool loaded = false;
  Route? route;

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
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        endDrawer: const NavDrawer(),
        appBar: AppBar(
          centerTitle: false,
          title: Row(
            children: [
              Text(
                "Hello ",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Text(
                loaded ? userData.firstName.toString() : "...",
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: HexColor(constants.primaryRed),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          shadowColor: Colors.transparent,
          backgroundColor: HexColor(constants.backgroundColor),
          elevation: 1,
          iconTheme: IconThemeData(
            color: HexColor(constants.primaryRed), //change your color here
          ),
        ),
        body: loaded == false
            ? const HomeLoad()
            : Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: ListView(
                  children: [
                    Container(
                      height: size.height * 0.35,
                      decoration: BoxDecoration(
                        color: HexColor(constants.backgroundColor),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(100),
                            bottomRight: Radius.circular(100)),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: size.height * 0.03),
                          Text(
                            "You own",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                          ),
                          SizedBox(height: size.height * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                currentuser.portfolioId!.ownedShares!.isNotEmpty
                                    ? currentuser.portfolioId!.ownedShares![0]
                                        .numberOfOwnedShares
                                        .toString()
                                    : "0",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                              ),
                              Text(
                                " Shares",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.06),
                          Row(
                            children: [
                              const Spacer(),
                              IconWhiteButton(
                                  iconName: Icon(Icons.arrow_downward,
                                      color: HexColor(constants.primaryRed)),
                                  title: "Purchase",
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const PurchaseMoreScreen()));
                                  }),
                              SizedBox(width: size.width * 0.05),
                              IconRedButton(
                                  iconName: const Icon(
                                    Icons.arrow_upward,
                                    color: Colors.white,
                                  ),
                                  title: "Transfer",
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const TransferScreen()));
                                  }),
                              const Spacer(),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.08),
                    DashboardCard(
                        name: "Purchased Shares",
                        nbShares: currentuser.numberOfPurchasedShares == 0
                            ? "0"
                            : currentuser.numberOfPurchasedShares.toString(),
                        icon: "Icons"),
                    DashboardCard(
                        name: "Transfered Shares",
                        nbShares: currentuser.numberOfTransferedShares == 0
                            ? "0"
                            : currentuser.numberOfTransferedShares.toString(),
                        icon: "Icons"),
                    DashboardCard(
                        name: "Recieved Shares",
                        nbShares: currentuser.numberOfRecievedShares == 0
                            ? "0"
                            : currentuser.numberOfRecievedShares.toString(),
                        icon: "Icons"),
                  ],
                ),
              ));
  }
}
