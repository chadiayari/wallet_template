import 'package:wallet_template/components/buttons.dart';
import 'package:wallet_template/components/input_field.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../constants.dart' as constants;
import '../../constants.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfile();
}

class _EditProfile extends State<EditProfile> with WidgetsBindingObserver {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController secondNameConntroller = TextEditingController();
  final TextEditingController adccNbController = TextEditingController();
  final TextEditingController emiratesIdController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController prfPhoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController prfEmailController = TextEditingController();
  final TextEditingController expiryController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  bool emailHasValue = false;
  bool passwordHasValue = false;
  String dropdownValue = 'Male';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Edit Profile",
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
        child: ListView(
          children: [
            SizedBox(height: size.height * 0.03),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05),
              child: EditProfileField(
                hintText: "Full Name",
                onPressed: () {},
                inputController: firstNameController,
                onChanged: (text) => setState(() {
                  if (text != "") {
                    emailHasValue = true;
                  } else {
                    emailHasValue = false;
                  }
                }),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05),
              child: EditProfileField(
                hintText: "Phone Number",
                onPressed: () {},
                inputController: prfPhoneController,
                onChanged: (text) => setState(() {
                  if (text != "") {
                    passwordHasValue = true;
                  } else {
                    passwordHasValue = false;
                  }
                }),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05),
              child: EditProfileField(
                hintText: "Email",
                onPressed: () {},
                inputController: emailController,
                onChanged: (text) => setState(() {
                  if (text != "") {
                    passwordHasValue = true;
                  } else {
                    passwordHasValue = false;
                  }
                }),
              ),
            ),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
            RedButton(title: "Save", onPressed: () {}),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
