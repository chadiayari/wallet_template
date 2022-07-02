import 'package:wallet_template/components/home_widget.dart';
import 'package:wallet_template/screens/sign_screens/fund_screen.dart';
import 'package:wallet_template/screens/transfer_screen.dart';
import 'package:wallet_template/widgets/dashboard_widget.dart';
import 'package:wallet_template/widgets/nav_drawer.dart';
import 'package:flutter/material.dart';
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
        extendBodyBehindAppBar: true,
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
          backgroundColor: Colors.transparent,
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
                margin: EdgeInsets.symmetric(
                    vertical: size.height * 0.03,
                    horizontal: size.width * 0.05),
                height: size.height * 0.15,
                decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                          "12",
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
                  ],
                ),
              ),
              Row(
                children: [
                  HomeWidget(
                      title: "Purchase",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const FundScreen(),
                          ),
                        );
                      }),
                  HomeWidget(
                      title: "Transfer",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const TransferScreen()));
                      }),
                ],
              ),
              SizedBox(height: size.height * 0.03),
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
