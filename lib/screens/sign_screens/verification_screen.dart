import 'package:wallet_template/components/buttons.dart';
import 'package:wallet_template/components/input_field.dart';
import 'package:wallet_template/screens/sign_screens/referral_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../constants.dart' as constants;

class VerifyDetails extends StatefulWidget {
  const VerifyDetails({Key? key}) : super(key: key);

  @override
  State<VerifyDetails> createState() => _VerifyDetails();
}

class _VerifyDetails extends State<VerifyDetails> with WidgetsBindingObserver {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Loader.hide();
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
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Text(
              "Verify your details",
              style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: HexColor(constants.primaryColor),
                  fontWeight: FontWeight.normal),
            ),
            SizedBox(height: size.height * 0.05),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              // ignore: unnecessary_const
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Is the Following your preferred e-mail?"),
                    Text("email"),
                  ],
                ),
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(left: size.width * 0.05),
            //   child: LoginInputField(
            //     hintText: emailController.toString(),
            //     onPressed: () {},
            //     inputController: emailController,
            //     onChanged: (value) {},
            //     pwd: false,
            //   ),
            // ),
            SizedBox(height: size.height * 0.03),

            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Is the Following your preferred phone number?"),
                      Text("phone"),
                    ],
                  )),
            ),
            // Padding(
            //   padding: EdgeInsets.only(left: size.width * 0.05),
            //   child: InputField(
            //       hintText: "105 5023 5236",
            //       onPressed: () {},
            //       inputController: phoneController),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: InputField(
                  hintText: "",
                  onPressed: () => {},
                  inputController: emailController),
            ),

            SizedBox(height: size.height * 0.35),
            RedButton(
                title: "Continue",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const ReferralScreen()));
                }),
          ],
        ),
      ),
    );
  }
}
