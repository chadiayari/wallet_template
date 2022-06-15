import 'package:wallet_template/components/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../constants.dart' as constants;

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  _LanguageScreen createState() => _LanguageScreen();
}

enum SingingCharacter { english, arabic }

class _LanguageScreen extends State<LanguageScreen>
    with WidgetsBindingObserver {
  SingingCharacter? _character = SingingCharacter.english;

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
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Text(
              "Select language",
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
                    activeColor: HexColor(constants.primaryRed),
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
      ),
    );
  }
}