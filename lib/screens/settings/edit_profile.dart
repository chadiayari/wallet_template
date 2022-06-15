import 'package:wallet_template/components/input_field.dart';
import 'package:wallet_template/models/login_user.dart';
import 'package:wallet_template/models/user.dart';
import 'package:wallet_template/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../constants.dart' as constants;

class EditProfile extends StatefulWidget {
  final User user = User();

  EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfile createState() => _EditProfile();
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
  LoggedInUser userData = LoggedInUser();
  bool emailHasValue = false;
  bool passwordHasValue = false;
  String dropdownValue = 'Male';
  getUser() async {
    firstNameController.text = userData.firstName.toString();
    secondNameConntroller.text = userData.lastName.toString();
    adccNbController.text = userData.emiratesId.toString();
    emiratesIdController.text = userData.emiratesId.toString();
    phoneController.text = userData.phoneNumber.toString();
    prfPhoneController.text = userData.preferredPhoneNumber.toString();
    emailController.text = userData.email.toString();
    prfEmailController.text = userData.preferredEmail.toString();
    expiryController.text = userData.emirates!.expieryDate.toString();
    addressController.text = userData.address.toString();
    genderController.text = userData.gender.toString();
  }

  updateControllers(input) {
    firstNameController.text = input.firstName.toString();
    secondNameConntroller.text = input.lastName.toString();
    adccNbController.text = input.emiratesId.toString();
    emiratesIdController.text = input.emiratesId.toString();
    phoneController.text = input.phoneNumber.toString();
    prfPhoneController.text = input.preferredPhoneNumber.toString();
    emailController.text = input.email.toString();
    prfEmailController.text = input.preferredEmail.toString();
    expiryController.text = input.emirates!.expieryDate.toString();
    addressController.text = input.address.toString();
    genderController.text = input.gender.toString();
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
  void initState() {
    super.initState();
    getUser();
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
        height: size.height,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: ListView(
          children: [
            Center(
              child: Text(
                "Edit Profile",
                style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: HexColor(constants.primaryRed),
                    fontWeight: FontWeight.normal),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.05, top: size.width * 0.1),
              // ignore: unnecessary_const
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text("First name"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05),
              child: EditProfileField(
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
              // ignore: unnecessary_const
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text("Last name"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05),
              child: EditProfileField(
                onPressed: () {},
                inputController: secondNameConntroller,
                onChanged: (text) => setState(() {
                  if (text != "") {
                    emailHasValue = true;
                  } else {
                    emailHasValue = false;
                  }
                }),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              // ignore: unnecessary_const
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text("ADCC Membership Number"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05),
              child: EditProfileField(
                onPressed: () {},
                inputController: adccNbController,
                onChanged: (text) => setState(() {
                  if (text != "") {
                    passwordHasValue = true;
                  } else {
                    passwordHasValue = false;
                  }
                }),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              // ignore: unnecessary_const
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text("Emirates ID number"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05),
              child: EditProfileField(
                onPressed: () {},
                inputController: emiratesIdController,
                onChanged: (text) => setState(() {
                  if (text != "") {
                    passwordHasValue = true;
                  } else {
                    passwordHasValue = false;
                  }
                }),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              // ignore: unnecessary_const
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text("Verified Phone"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05),
              child: EditProfileField(
                onPressed: () {},
                inputController: phoneController,
                onChanged: (text) => setState(() {
                  if (text != "") {
                    passwordHasValue = true;
                  } else {
                    passwordHasValue = false;
                  }
                }),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              // ignore: unnecessary_const
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text("Preferred Phone"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05),
              child: EditProfileField(
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
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              // ignore: unnecessary_const
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text("Verified E-mail"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05),
              child: EditProfileField(
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
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              // ignore: unnecessary_const
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text("Preferred E-mail"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05),
              child: EditProfileField(
                onPressed: () {},
                inputController: prfEmailController,
                onChanged: (text) => setState(() {
                  if (text != "") {
                    passwordHasValue = true;
                  } else {
                    passwordHasValue = false;
                  }
                }),
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              // ignore: unnecessary_const
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text("Emirates ID - Date of Expiry"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05),
              child: EditProfileField(
                onPressed: () {},
                inputController: expiryController,
                onChanged: (text) => setState(() {
                  if (text != "") {
                    passwordHasValue = true;
                  } else {
                    passwordHasValue = false;
                  }
                }),
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              // ignore: unnecessary_const
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text("Address Line"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05),
              child: EditProfileField(
                onPressed: () {},
                inputController: addressController,
                onChanged: (text) => setState(() {
                  if (text != "") {
                    passwordHasValue = true;
                  } else {
                    passwordHasValue = false;
                  }
                }),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              // ignore: unnecessary_const
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text("Date of Birth"),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              // ignore: unnecessary_const
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text("Gender"),
              ),
            ),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
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
                          color: HexColor(constants.primaryRed),
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

            // Consumer<Avatar>(builder: (context, avatar, _) {
            //   return
            Container(
              padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
              child: MaterialButton(
                minWidth: size.width * 0.4,
                height: 50,
                color: HexColor(constants.primaryRed),
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
                  setState(() {
                    loading();
                  });
                  Map data = {
                    "firstName": firstNameController.text,
                    "lastName": secondNameConntroller.text,
                    "emiratesId": adccNbController.text,
                    "phoneNumber": phoneController.text,
                    "preferredEmail": prfPhoneController.text,
                    "email": emailController.text,
                    "expieryDate": prfEmailController.text,
                    "nick_name": expiryController.text,
                    "address": addressController.text,
                    "gender": genderController.text,
                  };

                  try {
                    Loader.hide();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Profile edited successfully')));
                    Navigator.of(context).pop();
                  } catch (err) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Could not edit profile')));
                    Loader.hide();
                  }
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
