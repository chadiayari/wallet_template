import 'package:wallet_template/screens/settings/settings_screen.dart';
import 'package:wallet_template/screens/sign_screens/welcome_screen.dart';
import 'package:wallet_template/screens/transaction_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../constants.dart' as constants;

import 'dart:ui';

class NavDrawer extends StatefulWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    logoutPopup() {
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
                  height: size.height * 0.2,
                  width: size.width * 0.9,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Text(
                          "You are about to leave the app",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.normal),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MaterialButton(
                                minWidth: size.height * 0.04,
                                height: size.height * 0.04,
                                color: Colors.grey,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        topLeft: Radius.circular(10))),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const <Widget>[
                                      Text(
                                        "Stay",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ]),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                            MaterialButton(
                                minWidth: size.height * 0.04,
                                height: size.height * 0.04,
                                color: Colors.grey,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(10),
                                        topRight: Radius.circular(10))),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const <Widget>[
                                      Text(
                                        "Exit",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            color: Colors.black),
                                      ),
                                    ]),
                                onPressed: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            const WelcomeScreen()),
                                    (_) => false,
                                  );
                                }),
                          ],
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
    }

    qrPopup() {
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
                      color: HexColor(constants.secondaryColor)),
                  padding: const EdgeInsets.all(15),
                  height: 250,
                  width: 250,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.qr_code_2_sharp,
                          color: Colors.black,
                          size: size.width * 0.3,
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text(
                          "First Name",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  color: Colors.black,
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

    return Drawer(
      backgroundColor: Colors.grey[850],
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              children: [
                Icon(
                  Icons.account_circle,
                  size: size.width * 0.2,
                ),
                SizedBox(height: size.height * 0.01),
                Text(
                  "First Name",
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: HexColor(constants.secondaryColor),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.qr_code_2,
                color: HexColor(constants.secondaryColor)),
            title: Text(
              'QR Code',
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: HexColor(constants.secondaryColor),
                  fontWeight: FontWeight.normal),
            ),
            onTap: () => {Navigator.pop(context), qrPopup()},
          ),
          ListTile(
            leading:
                Icon(Icons.settings, color: HexColor(constants.secondaryColor)),
            title: Text(
              'Settings',
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: HexColor(constants.secondaryColor),
                  fontWeight: FontWeight.normal),
            ),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const SettingsScreen())),
            },
          ),
          ListTile(
            leading: Icon(Icons.picture_as_pdf,
                color: HexColor(constants.secondaryColor)),
            title: Text(
              'Generate Certificate',
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: HexColor(constants.secondaryColor),
                  fontWeight: FontWeight.normal),
            ),
            onTap: () => {},
          ),
          ListTile(
            leading:
                Icon(Icons.history, color: HexColor(constants.secondaryColor)),
            title: Text(
              'Transaction history',
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: HexColor(constants.secondaryColor),
                  fontWeight: FontWeight.normal),
            ),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const TransactionScreen()))
            },
          ),
          ListTile(
            leading:
                Icon(Icons.logout, color: HexColor(constants.secondaryColor)),
            title: Text(
              'Logout',
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: HexColor(constants.secondaryColor),
                  fontWeight: FontWeight.normal),
            ),
            onTap: () => {Navigator.pop(context), logoutPopup()},
          ),
        ],
      ),
    );
  }
}
