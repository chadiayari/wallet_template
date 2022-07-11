import 'package:wallet_template/components/buttons.dart';
import 'package:wallet_template/components/input_field.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../constants.dart' as constants;
import '../../constants.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePassword();
}

class _ChangePassword extends State<ChangePassword>
    with WidgetsBindingObserver {
  final TextEditingController oldPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController newPasswordConfirm = TextEditingController();
  String? userID = "";
  bool pwdHasValue = false;
  bool newPwdHasValue = false;
  bool confNewPwdHasValue = false;

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
        centerTitle: false,
        title: Text(
          "Change Password",
          style: Theme.of(context).textTheme.headline5!.copyWith(
              color: HexColor(constants.secondaryColor),
              fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: HexColor(constants.secondaryColor),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        decoration: backgroundGradientStyle,
        child: ListView(
          children: [
            SizedBox(height: size.width * 0.1),
            SignupInputField(
              iconData: Icons.lock,
              pwd: true,
              hintText: "Old password",
              onPressed: () {},
              inputController: oldPassword,
              onChanged: (text) => setState(() {
                if (text != "") {
                  pwdHasValue = true;
                } else {
                  pwdHasValue = false;
                }
              }),
            ),
            SignupInputField(
              iconData: Icons.lock,
              pwd: true,
              hintText: "New password",
              onPressed: () {},
              inputController: newPassword,
              onChanged: (text) => setState(() {
                if (text != "") {
                  newPwdHasValue = true;
                } else {
                  newPwdHasValue = false;
                }
              }),
            ),
            SignupInputField(
              iconData: Icons.lock,
              pwd: true,
              hintText: "Confirm new password",
              onPressed: () {},
              inputController: newPasswordConfirm,
              onChanged: (text) => setState(() {
                if (text != "") {
                  confNewPwdHasValue = true;
                } else {
                  confNewPwdHasValue = false;
                }
              }),
            ),
            SizedBox(height: size.height * 0.03),
            MainButton(title: "Save", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
