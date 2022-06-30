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
import '../../constants.dart';

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
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            "Settings",
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
          decoration: backgroundGradientStyle,
          child: ListView(
            children: [
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
                padding: EdgeInsets.symmetric(vertical: size.width * 0.02),
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 7,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
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
                                  color: Colors.white,
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
