import 'package:wallet_template/screens/sign_screens/fund_screen.dart';
import 'package:wallet_template/components/buttons.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../constants.dart' as constants;

class ReferralScreen extends StatefulWidget {
  const ReferralScreen({Key? key}) : super(key: key);

  @override
  State<ReferralScreen> createState() => _ReferralScreen();
}

class _ReferralScreen extends State<ReferralScreen> {
  String dropdownValue = 'Social media';
  final TextEditingController referralController = TextEditingController();
  bool referral = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          title: Text(
            "Where did you hear about us?",
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
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: ListView(
          children: [
            SizedBox(
              height: size.height * 0.04,
            ),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child:
                    FormField<String>(builder: (FormFieldState<String> state) {
                  return InputDecorator(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: HexColor(constants.primaryColor),
                        ),
                        isDense: true,
                        value: dropdownValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                            if (dropdownValue == 'A friend' ||
                                dropdownValue == 'Other' ||
                                dropdownValue == 'Hoot.ae') {
                              referral = true;
                            } else {
                              referral = false;
                            }
                          });
                        },
                        items: <String>[
                          'Social media',
                          'A friend',
                          'Search engine',
                          'News',
                          'Other'
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
            Container(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05, vertical: size.width * 0.05),
                child: referral
                    ? TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Field can't be empty";
                          }
                          return null;
                        },
                        obscureText: false,
                        controller: referralController,
                        cursorColor: Colors.white,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: HexColor(constants.primaryColor)),
                            ),
                            hintText: dropdownValue == 'A friend'
                                ? "Please enter the name of the friend"
                                : (dropdownValue == 'Other'
                                    ? "Please tell us about it"
                                    : "")),
                      )
                    : const Text(" ")),
            SizedBox(height: size.height * 0.4),
            RedButton(
                title: "Continue",
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const FundScreen()));
                }),
          ],
        ));
  }
}
