import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../constants.dart' as constants;

class InputField extends StatelessWidget {
  final String hintText;
  final VoidCallback onPressed;
  final TextEditingController inputController;

  const InputField({
    Key? key,
    required this.hintText,
    required this.onPressed,
    required this.inputController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20, bottom: 30),
      child: TextFormField(
        controller: inputController,
        cursorColor: Colors.white,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hintText,
          border: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.3)),
        ),
      ),
    );
  }
}

class LoginInputField extends StatelessWidget {
  final String hintText;
  final bool pwd;
  final VoidCallback onPressed;
  final TextEditingController inputController;
  final ValueChanged onChanged;

  const LoginInputField({
    Key? key,
    required this.hintText,
    required this.pwd,
    required this.onPressed,
    required this.inputController,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding:
          EdgeInsets.only(right: size.width * 0.05, bottom: size.width * 0.05),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "Field can't be empty";
          }
          return null;
        },
        obscureText: pwd,
        enableSuggestions: !pwd,
        autocorrect: !pwd,
        onChanged: onChanged,
        controller: inputController,
        cursorColor: Colors.white,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          fillColor: Colors.white,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: HexColor(constants.primaryColor)),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.3)),
        ),
      ),
    );
  }
}

class EditProfileField extends StatelessWidget {
  final VoidCallback onPressed;
  final TextEditingController inputController;
  final ValueChanged onChanged;

  const EditProfileField({
    Key? key,
    required this.onPressed,
    required this.inputController,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding:
          EdgeInsets.only(right: size.width * 0.05, bottom: size.width * 0.05),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "Field can't be empty";
          }
          return null;
        },
        onChanged: onChanged,
        controller: inputController,
        cursorColor: Colors.white,
        style: TextStyle(
            color: HexColor(constants.primaryColor),
            fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          fillColor: Colors.white,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: HexColor(constants.primaryColor)),
          ),
        ),
      ),
    );
  }
}
