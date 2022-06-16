import 'package:wallet_template/screens/settings/change_password.dart';
import 'package:wallet_template/screens/settings/contact_support.dart';
import 'package:wallet_template/screens/settings/edit_profile.dart';
import 'package:wallet_template/screens/settings/language_screen.dart';
import 'package:wallet_template/screens/settings/terms_screen.dart';
import 'package:wallet_template/widgets/settings_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../constants.dart' as constants;

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreen();
}

class _SettingsScreen extends State<SettingsScreen>
    with WidgetsBindingObserver {
  bool notifications = true;

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
              color: HexColor(constants.primaryColor),
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
                  "Settings",
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: HexColor(constants.primaryColor),
                      fontWeight: FontWeight.normal),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: size.width * 0.05,
                    left: size.width * 0.05,
                    bottom: size.width * 0.03),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Linked Profile",
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: size.width * 0.9,
                  padding: EdgeInsets.symmetric(vertical: size.width * 0.03),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(85, 201, 178, 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      const Spacer(),
                      Container(
                        color: const Color.fromRGBO(85, 201, 178, 1),
                        child:
                            const Icon(Icons.fingerprint, color: Colors.white),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: size.width * 0.05, top: size.width * 0.05),
                child: const Text(
                  "Account",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SettingsWidget(
                  title: "Edit Profile",
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditProfile()));
                  }),
              SettingsWidget(
                  title: "Change Password",
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChangePassword()));
                  }),
              Container(
                padding: EdgeInsets.only(
                    left: size.width * 0.05, top: size.width * 0.05),
                child: const Text(
                  "Notifications",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: size.width * 0.05,
                  right: size.width * 0.05,
                  top: size.width * 0.03,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        width: size.width * 0.9,
                        padding:
                            EdgeInsets.symmetric(vertical: size.width * 0.03),
                        decoration: BoxDecoration(
                          color: HexColor(constants.backgroundColor),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: size.width * 0.05,
                            ),
                            Text(
                              "Allow notifications",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                            ),
                            const Spacer(),
                            CupertinoSwitch(
                              value: notifications,
                              onChanged: (value) {
                                notifications = value;
                                setState(() {});
                              },
                            ),
                            SizedBox(
                              width: size.width * 0.05,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: size.width * 0.05, top: size.width * 0.05),
                child: const Text(
                  "More",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SettingsWidget(
                  title: "Language",
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LanguageScreen()));
                  }),
              SettingsWidget(
                  title: "Terms and conditions",
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TermsConditions()));
                  }),
              SettingsWidget(
                  title: "Contact support",
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ContactSupport()));
                  }),
              SizedBox(height: size.height * 0.08),
            ],
          ),
        ));
  }
}
