import 'package:wallet_template/components/input_field.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../constants.dart' as constants;
import '../dashboard_screen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreen();
}

class _SigninScreen extends State<SigninScreen> with WidgetsBindingObserver {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool emailHasValue = false;
  bool passwordHasValue = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Sign in",
          style: Theme.of(context).textTheme.headline5!.copyWith(
              color: HexColor(constants.primaryColor),
              fontWeight: FontWeight.normal),
        ),
        centerTitle: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_outlined,
            color: HexColor(constants.primaryColor),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.08,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text("Email"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.05),
            child: LoginInputField(
              hintText: "exmp@example.com",
              onPressed: () {},
              inputController: emailController,
              onChanged: (text) => setState(() {
                if (text != "") {
                  emailHasValue = true;
                } else {
                  emailHasValue = false;
                }
              }),
              pwd: false,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.05),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text("Password"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.05),
            child: LoginInputField(
              hintText: "*****",
              onPressed: () {},
              inputController: passwordController,
              onChanged: (text) => setState(() {
                if (text != "") {
                  passwordHasValue = true;
                } else {
                  passwordHasValue = false;
                }
              }),
              pwd: true,
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
            child: MaterialButton(
              minWidth: size.width * 0.4,
              height: 50,
              color: (emailHasValue && passwordHasValue)
                  ? HexColor(constants.primaryColor)
                  : HexColor(constants.primaryColor).withOpacity(0.3),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      "Sign in",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ]),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const DashboardScreen()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
