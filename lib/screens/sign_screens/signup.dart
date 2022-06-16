import 'package:flutter/material.dart';
import 'dart:async';

enum SingingCharacter { male, female, other }

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirm = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _name = TextEditingController();
  SingingCharacter? _character = SingingCharacter.male;
  bool isChecked = false;
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Signup",
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
                    child: TextFormField(
                        controller: _name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Name can't be empty";
                          }
                          return null;
                        },
                        style: const TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                            helperStyle: TextStyle(color: Colors.white),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            labelText: "Full name",
                            labelStyle: TextStyle(color: Colors.white))),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
                    child: TextFormField(
                        controller: _email,
                        validator: (email) {
                          if (email!.isEmpty) {
                            return "Email Address can't be empty";
                          }
                          return null;
                        },
                        style: const TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                            helperStyle: TextStyle(color: Colors.white),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            labelText: "Email Address",
                            labelStyle: TextStyle(color: Colors.white))),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        const Text(
                          "Date of birth",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        ElevatedButton(
                          onPressed: () => _selectDate(context),
                          child: const Text('Select date'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "${selectedDate.toLocal()}".split(' ')[0],
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Gender",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    textColor: Colors.white,
                    title: const Text('Male'),
                    leading: Radio<SingingCharacter>(
                      activeColor: Colors.white,
                      value: SingingCharacter.male,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    textColor: Colors.white,
                    title: const Text('Female'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.female,
                      groupValue: _character,
                      activeColor: Colors.white,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    textColor: Colors.white,
                    title: const Text('Other'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.other,
                      groupValue: _character,
                      activeColor: Colors.white,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                    child: TextFormField(
                      controller: _password,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password can't be empty";
                        }
                        return null;
                      },
                      obscureText: true,
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        helperStyle: TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                    child: TextFormField(
                      controller: _confirm,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Confirm Password can't be empty";
                        } else if (_password.text != value) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      obscureText: true,
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        helperStyle: TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        labelText: "Confirm Password",
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      const Text(
                        "I accept terms and conditions of usage",
                        style: TextStyle(color: Colors.white),
                      ),
                      const Spacer(),
                      Checkbox(
                          checkColor: Colors.white,
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          }),
                      const Spacer(),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                    child: MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: const Text(
                          "Signup",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.black),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {}
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "Already have an account? ",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
