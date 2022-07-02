import 'package:wallet_template/components/input_field.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:wallet_template/screens/sign_screens/referral_screen.dart';
import '../../constants.dart' as constants;
import '../../constants.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreen();
}

class _SignupScreen extends State<SignupScreen> with WidgetsBindingObserver {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isChecked = false;
  String dropdownValue = 'Male';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return HexColor(constants.secondaryColor);
      }
      return HexColor(constants.blue);
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Sign up",
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
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        decoration: backgroundGradientStyle,
        child: ListView(children: [
          SizedBox(height: size.height * 0.04),
          SignupInputField(
            iconData: Icons.account_box,
            onChanged: (value) {},
            pwd: false,
            hintText: "Enter Full Name",
            onPressed: () {},
            inputController: fullNameController,
          ),
          SignupInputField(
              iconData: Icons.email,
              onChanged: (value) {},
              pwd: false,
              hintText: "Enter Email",
              onPressed: () {},
              inputController: emailController),
          SignupInputField(
              iconData: Icons.lock,
              onChanged: (value) {},
              pwd: true,
              hintText: "Enter Password",
              onPressed: () {},
              inputController: passwordController),
          SignupInputField(
              iconData: Icons.lock,
              onChanged: (value) {},
              pwd: true,
              hintText: "Confirm Password",
              onPressed: () {},
              inputController: confirmPasswordController),
          Container(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 15, bottom: 30),
              child: FormField<String>(builder: (FormFieldState<String> state) {
                return InputDecorator(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: HexColor(constants.blue),
                      ),
                      isDense: true,
                      value: dropdownValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>[
                        'Male',
                        'Female',
                        'Other',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                );
              })),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
              Text(
                'I agree to the terms and conditions and the Privacy Policy',
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(fontWeight: FontWeight.normal),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
            child: MaterialButton(
              minWidth: size.width * 0.4,
              height: 50,
              color: isChecked
                  ? HexColor(constants.secondaryColor)
                  : HexColor(constants.secondaryColor).withOpacity(0.3),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      "Sign up",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                          color: Colors.black87),
                    ),
                  ]),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const ReferralScreen()));
              },
            ),
          ),
        ]),
      ),
    );
  }
}
