import 'package:wallet_template/components/input_field.dart';
import 'package:wallet_template/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../constants.dart' as constants;

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
      body: ListView(
        children: [
          Center(
            child: Text(
              "Sign in",
              style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: HexColor(constants.primaryColor),
                  fontWeight: FontWeight.normal),
            ),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text("Emirates ID"),
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
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
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
          const Spacer(),
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const HomeScreen()));
              },
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
