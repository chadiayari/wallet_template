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
        cursorColor: Colors.black,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintText: hintText,
          border: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          hintStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
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
        cursorColor: Colors.black,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          fillColor: Colors.white,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: HexColor(constants.primaryRed)),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
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
        cursorColor: Colors.black,
        style: TextStyle(
            color: HexColor(constants.primaryRed), fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          fillColor: Colors.white,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: HexColor(constants.primaryRed)),
          ),
        ),
      ),
    );
  }
}
