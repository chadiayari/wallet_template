import 'package:wallet_template/components/buttons.dart';
import 'package:wallet_template/screens/purchase_more_funds.dart';
import 'package:wallet_template/screens/transfer_screen.dart';
import 'package:wallet_template/widgets/dashboard_widget.dart';
import 'package:wallet_template/widgets/nav_drawer.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../constants.dart' as constants;
import '../constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  Route? route;

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
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Text(
                "User",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          shadowColor: Colors.transparent,
          backgroundColor: HexColor(constants.blue),
          elevation: 1,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
        body: Container(
          decoration: backgroundGradientStyle,
          child: ListView(
            children: [
              Container(
                height: size.height * 0.15,
                decoration: BoxDecoration(
                  color: HexColor(constants.blue),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.03),
                    Text(
                      "You own",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.normal),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "0",
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                        ),
                        Text(
                          " Shares",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.06),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.08),
              Row(
                children: [
                  const Spacer(),
                  IconWhiteButton(
                      iconName: Icon(Icons.arrow_downward,
                          color: HexColor(constants.primaryColor)),
                      title: "Purchase",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const PurchaseMoreScreen()));
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
                                builder: (_) => const TransferScreen()));
                      }),
                  const Spacer(),
                ],
              ),
              SizedBox(height: size.height * 0.08),
              const DashboardCard(
                  name: "Purchased Shares", nbShares: "0", icon: "Icons"),
              const DashboardCard(
                  name: "Transfered Shares", nbShares: "0", icon: "Icons"),
              const DashboardCard(
                  name: "Recieved Shares", nbShares: "0", icon: "Icons"),
            ],
          ),
        ));
  }
}
