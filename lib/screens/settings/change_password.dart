import 'package:wallet_template/components/input_field.dart';
import 'package:wallet_template/models/login_user.dart';
import 'package:wallet_template/models/user.dart';
import 'package:wallet_template/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../constants.dart' as constants;

class ChangePassword extends StatefulWidget {
  ChangePassword({Key? key}) : super(key: key);
  final User user = User();

  @override
  _ChangePassword createState() => _ChangePassword();
}

class _ChangePassword extends State<ChangePassword>
    with WidgetsBindingObserver {
  final TextEditingController oldPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController newPasswordConfirm = TextEditingController();
  String? userID = "";
  final bool _isLoading = false;
  bool pwdHasValue = false;
  bool newPwdHasValue = false;
  bool confNewPwdHasValue = false;
  LoggedInUser userData = LoggedInUser();
  var response;

  loading() {
    Loader.show(
      context,
      isAppbarOverlay: true,
      isBottomBarOverlay: true,
      progressIndicator: const Load(),
    );
  }

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
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_outlined,
            color: HexColor(constants.primaryRed),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Text(
                    "Change Password",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: HexColor(constants.primaryRed),
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(height: size.width * 0.1),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    // ignore: unnecessary_const
                    child: const Align(
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
                    // ignore: unnecessary_const
                    child: const Align(
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
                    // ignore: unnecessary_const
                    child: const Align(
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
                      color:
                          (pwdHasValue && newPwdHasValue && confNewPwdHasValue)
                              ? HexColor(constants.primaryRed)
                              : HexColor(constants.primaryRed).withOpacity(0.3),
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
                      onPressed: () async {
                        if (newPassword.value == newPasswordConfirm.value) {
                          setState(() {
                            loading();
                          });
                          Map data = {
                            "oldPassword": oldPassword.text,
                            "newPassword": newPassword.text,
                          };

                          try {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Password changed')));
                            Navigator.of(context).pop();
                            Loader.hide();
                          } catch (err) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Please verify your input')));
                            Loader.hide();
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Passwords don't match."),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  SizedBox(height: size.width * 0.2),
                ],
              ),
            ),
    );
  }
}
