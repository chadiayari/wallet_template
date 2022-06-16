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
                      color: Colors.white),
                  padding: const EdgeInsets.all(15),
                  height: size.height * 0.25,
                  width: size.width * 0.9,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "You are about to leave the app",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MaterialButton(
                                minWidth: size.height * 0.04,
                                height: size.height * 0.04,
                                color: Colors.white,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        topLeft: Radius.circular(10))),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Stay",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            color: HexColor(
                                                constants.primaryColor)),
                                      ),
                                    ]),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                            MaterialButton(
                                minWidth: size.height * 0.04,
                                height: size.height * 0.04,
                                color: Colors.white,
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
                      color: HexColor(constants.backgroundColor)),
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
                          "First Name" "Last Name",
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
      backgroundColor: HexColor(constants.backgroundColor),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              children: [
                Icon(
                  Icons.account_circle,
                  color: Colors.black,
                  size: size.width * 0.1,
                ),
                Text(
                  "First" "Last",
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: HexColor(constants.primaryColor),
                      fontWeight: FontWeight.normal),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Id number",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.normal),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: IconButton(
                        icon: const Icon(Icons.copy),
                        iconSize: size.width * 0.05,
                        onPressed: () {
                          Clipboard.setData(
                              const ClipboardData(text: "First Name"));
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            leading:
                Icon(Icons.qr_code_2, color: HexColor(constants.primaryColor)),
            title: Text(
              'QR Code',
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: HexColor(constants.primaryColor),
                  fontWeight: FontWeight.normal),
            ),
            onTap: () => {Navigator.pop(context), qrPopup()},
          ),
          ListTile(
            leading:
                Icon(Icons.settings, color: HexColor(constants.primaryColor)),
            title: Text(
              'Settings',
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: HexColor(constants.primaryColor),
                  fontWeight: FontWeight.normal),
            ),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const SettingsScreen())),
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.share, color: HexColor(constants.primaryColor)),
          //   title: Text('Share purchase',
          //       style: Theme.of(context).textTheme.subtitle1!.copyWith(
          //           color: HexColor(constants.primaryColor),
          //           fontWeight: FontWeight.normal)),
          //   onTap: () => {},
          // ),
          // ListTile(
          //   leading: Icon(
          //     Icons.money,
          //     color: HexColor(constants.primaryColor),
          //   ),
          //   title: Text(
          //     'Share transfer',
          //     style: Theme.of(context).textTheme.subtitle1!.copyWith(
          //         color: HexColor(constants.primaryColor),
          //         fontWeight: FontWeight.normal),
          //   ),
          //   onTap: () => {Navigator.of(context).pop()},
          // ),
          ListTile(
            leading: Icon(Icons.picture_as_pdf,
                color: HexColor(constants.primaryColor)),
            title: Text(
              'Generate Certificate',
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: HexColor(constants.primaryColor),
                  fontWeight: FontWeight.normal),
            ),
            onTap: () => {},
          ),
          ListTile(
            leading:
                Icon(Icons.history, color: HexColor(constants.primaryColor)),
            title: Text(
              'Transaction history',
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: HexColor(constants.primaryColor),
                  fontWeight: FontWeight.normal),
            ),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const TransactionScreen()))
            },
          ),
          ListTile(
            leading:
                Icon(Icons.logout, color: HexColor(constants.primaryColor)),
            title: Text(
              'Logout',
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: HexColor(constants.primaryColor),
                  fontWeight: FontWeight.normal),
            ),
            onTap: () => {Navigator.pop(context), logoutPopup()},
          ),
        ],
      ),
    );
  }
}
