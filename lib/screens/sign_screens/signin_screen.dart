import 'package:wallet_template/components/input_field.dart';
import 'package:wallet_template/screens/home_screen.dart';
import 'package:wallet_template/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
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
  final bool _isLoading = false;
  bool emailHasValue = false;
  bool passwordHasValue = false;

  @override
  void dispose() {
    super.dispose();
    Loader.hide();
  }

  @override
  void initState() {
    super.initState();
  }

  loading() {
    Loader.show(
      context,
      isAppbarOverlay: true,
      isBottomBarOverlay: true,
      progressIndicator: const Load(),
    );
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
              child: ListView(
                children: [
                  Center(
                    child: Text(
                      "Sign in",
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: HexColor(constants.primaryColor),
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(size.width * 0.05),
                    child: Text(
                      'A UAE Pass is required to log into your ADCC account',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.normal),
                    ),
                  ),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    // ignore: unnecessary_const
                    child: const Align(
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
                    // ignore: unnecessary_const
                    child: const Align(
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
                    margin: const EdgeInsets.all(15),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: HexColor(constants.backgroundColor),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Row(
                      children: [
                        const Spacer(),
                        Container(
                          color: const Color.fromRGBO(85, 201, 178, 1),
                          child: const Icon(Icons.fingerprint,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: size.width * 0.1,
                        ),
                        Text(
                          "Sign in with UAE PASS",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),

                  const Spacer(),
                  // Consumer<Avatar>(builder: (context, avatar, _) {
                  //   return
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
                      onPressed: () async {
                        setState(() {
                          loading();
                        });
                        Loader.hide();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const HomeScreen()));
                      },
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
    );
  }
}
