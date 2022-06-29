import 'package:wallet_template/screens/profile_screens/profile_capital.dart';
import 'package:wallet_template/screens/profile_screens/profile_profit.dart';
import 'package:wallet_template/screens/profile_screens/profile_projects.dart';
import 'package:wallet_template/widgets/nav_drawer.dart';
import 'package:wallet_template/widgets/profile_circles.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/services.dart';

import '../../../constants.dart' as constants;
import '../../constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> with WidgetsBindingObserver {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController adccNbController = TextEditingController();
  final TextEditingController emiratesIdController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController prefPhoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController prefEmailController = TextEditingController();
  final TextEditingController emiratedExpiryController =
      TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  bool profit = true;
  bool shares = false;
  bool isSelected1 = true;
  bool isSelected2 = false;
  bool isSelected3 = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      endDrawer: const NavDrawer(),
      appBar: AppBar(
        centerTitle: false,
        title: Container(
          height: size.height * 0.2,
          decoration: BoxDecoration(
            color: HexColor(constants.blue),
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
          child: Icon(
            Icons.account_circle_rounded,
            size: size.width * 0.1,
            color: Colors.white,
          ),
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
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: size.width * 0.05),
                  height: size.height * 0.15,
                  decoration: BoxDecoration(
                    color: HexColor(constants.blue),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: size.width * 0.03),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "first name",
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Clipboard.setData(const ClipboardData(text: "sss"));
                        },
                        child: Row(
                          children: [
                            Text(
                              "id",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(fontWeight: FontWeight.normal),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.copy,
                              ),
                              iconSize: size.width * 0.05,
                              onPressed: () {
                                Clipboard.setData(
                                    const ClipboardData(text: "sss"));
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: size.height * 0.06,
                  margin: EdgeInsets.all(size.width * 0.05),
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProfileCircle(
                        name: 'Profit',
                        isSelected: isSelected1,
                        onPressed: () => {
                          setState(() {
                            isSelected1 = true;
                            isSelected2 = false;
                            isSelected3 = false;
                            profit = true;
                            shares = false;
                          })
                        },
                      ),
                      ProfileCircle(
                        name: "Shares & Capital",
                        isSelected: isSelected2,
                        onPressed: () => {
                          setState(() {
                            isSelected1 = false;
                            isSelected2 = true;
                            isSelected3 = false;
                            profit = false;
                            shares = true;
                          })
                        },
                      ),
                      ProfileCircle(
                        name: "Projects & R.O.P",
                        isSelected: isSelected3,
                        onPressed: () => setState(() {
                          isSelected1 = false;
                          isSelected2 = false;
                          isSelected3 = true;
                          profit = false;
                          shares = false;
                        }),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Spacer(),
                    Container(
                      padding: EdgeInsets.only(top: size.width * 0.2),
                    ),
                    const Spacer(),
                  ],
                ),
              ],
            ),
            profit
                ? const ProfileProfit()
                : (shares ? const ProfileCapital() : const ProfileProjects())
          ],
        ),
      ),
    );
  }
}
