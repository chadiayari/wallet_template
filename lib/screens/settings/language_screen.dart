import 'package:wallet_template/components/buttons.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../constants.dart' as constants;

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreen();
}

enum SingingCharacter { english, arabic }

class _LanguageScreen extends State<LanguageScreen>
    with WidgetsBindingObserver {
  SingingCharacter? _character = SingingCharacter.english;

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
      body: Column(
        children: [
          Text(
            "Select language",
            style: Theme.of(context).textTheme.headline5!.copyWith(
                color: HexColor(constants.primaryColor),
                fontWeight: FontWeight.normal),
          ),
          SizedBox(height: size.width * 0.1),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text("Choose your preferred language"),
            ),
          ),
          SizedBox(height: size.width * 0.1),
          Column(
            children: <Widget>[
              ListTile(
                title: const Text('English'),
                leading: Radio<SingingCharacter>(
                  value: SingingCharacter.english,
                  groupValue: _character,
                  activeColor: HexColor(constants.primaryColor),
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ),
            ],
          ),
          const Spacer(),
          RedButton(title: "Confirm", onPressed: () {}),
          SizedBox(height: size.width * 0.2),
        ],
      ),
    );
  }
}
