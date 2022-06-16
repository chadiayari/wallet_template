import 'package:wallet_template/components/input_field.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../constants.dart' as constants;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen>
    with WidgetsBindingObserver {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController secondNameConntroller = TextEditingController();
  final TextEditingController adccNbController = TextEditingController();
  final TextEditingController emiratesIdController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController prfPhoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController prfEmailController = TextEditingController();
  final TextEditingController expiryController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  bool isChecked = false;
  String dropdownValue = 'Male';
  String _selectedDate = '';

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      _selectedDate = args.value.toString();
    });
  }

  datePopup() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 50),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: SfDateRangePicker(
              onSelectionChanged: _onSelectionChanged,
              selectionMode: DateRangePickerSelectionMode.single,
            ),
          );
        });
  }

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
        return HexColor(constants.primaryBlue);
      }
      return HexColor(constants.primaryColor);
    }

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
      body: ListView(children: [
        Center(
          child: Text(
            "Register Manually",
            style: Theme.of(context).textTheme.headline5!.copyWith(
                color: HexColor(constants.primaryColor),
                fontWeight: FontWeight.normal),
          ),
        ),
        SizedBox(height: size.height * 0.04),
        const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text("First Name"),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: size.width * 0.05),
          child: LoginInputField(
            onChanged: (value) {},
            pwd: false,
            hintText: "-----",
            onPressed: () {},
            inputController: firstNameController,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text("Last Name"),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: size.width * 0.05),
          child: LoginInputField(
              onChanged: (value) {},
              pwd: false,
              hintText: "-----",
              onPressed: () {},
              inputController: secondNameConntroller),
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
              onChanged: (value) {},
              pwd: false,
              hintText: "-----",
              onPressed: () {},
              inputController: emailController),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text("EMIRATES ID Number"),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: size.width * 0.05),
          child: LoginInputField(
              onChanged: (value) {},
              pwd: false,
              hintText: "-----",
              onPressed: () {},
              inputController: emiratesIdController),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text("Address"),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: size.width * 0.05),
          child: LoginInputField(
              onChanged: (value) {},
              pwd: false,
              hintText: "-----",
              onPressed: () {},
              inputController: addressController),
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
              onChanged: (value) {},
              pwd: true,
              hintText: "-----",
              onPressed: () {},
              inputController: passwordController),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text("Confirm Password"),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: size.width * 0.05),
          child: LoginInputField(
              onChanged: (value) {},
              pwd: true,
              hintText: "-----",
              onPressed: () {},
              inputController: confirmPasswordController),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text("Gender"),
          ),
        ),
        Container(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 30),
            child: FormField<String>(builder: (FormFieldState<String> state) {
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
        const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text("Phone number"),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: size.width * 0.05),
          child: LoginInputField(
              onChanged: (value) {},
              pwd: false,
              hintText: "xxxxx",
              onPressed: () {},
              inputController: phoneController),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text("Date of Expiry"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: MaterialButton(
            height: 50,
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: const Text(
              "Select date",
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
            onPressed: () {
              datePopup();
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: size.width * 0.05),
          child: Text(_selectedDate),
        ),
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
                  .copyWith(color: Colors.black, fontWeight: FontWeight.normal),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
          child: MaterialButton(
            minWidth: size.width * 0.4,
            height: 50,
            color: isChecked
                ? HexColor(constants.primaryColor)
                : HexColor(constants.primaryColor).withOpacity(0.3),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text(
                    "Sign up",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                ]),
            onPressed: () {},
          ),
        ),
      ]),
    );
  }
}
