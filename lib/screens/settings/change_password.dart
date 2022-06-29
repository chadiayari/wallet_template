import 'package:wallet_template/components/input_field.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../constants.dart' as constants;

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
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Change Password",
          style: Theme.of(context).textTheme.headline5!.copyWith(
              color: HexColor(constants.primaryColor),
              fontWeight: FontWeight.normal),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_outlined,
            color: HexColor(constants.primaryColor),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          SizedBox(height: size.width * 0.1),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text("Old password"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.05),
            child: LoginInputField(
              pwd: true,
              hintText: "*****",
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
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text("New password"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.05),
            child: LoginInputField(
              pwd: true,
              hintText: "*****",
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
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text("Confirm new password"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.05),
            child: LoginInputField(
              pwd: true,
              hintText: "*****",
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
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
            child: MaterialButton(
              minWidth: size.width * 0.4,
              height: 50,
              color: (pwdHasValue && newPwdHasValue && confNewPwdHasValue)
                  ? HexColor(constants.primaryColor)
                  : HexColor(constants.primaryColor).withOpacity(0.3),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      "Save",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ]),
              onPressed: () async {},
            ),
          ),
          SizedBox(height: size.width * 0.2),
        ],
      ),
    );
  }
}
