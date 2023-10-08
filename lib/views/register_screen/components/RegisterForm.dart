import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one/utils/size_config.dart';

import '../../../utils/constant.dart';
import '../../home_screen/Home.dart';
import '../../signin_screen/Sign_in_screen.dart';
import 'FormError.dart';

class SignForm extends StatefulWidget {
  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _keyForm = GlobalKey<FormState>();

  List<String> errors = [];
  late String _email;
  String _password = "", _confirmPassword = "";

  bool remember = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _keyForm,
      child: Column(
        children: [
          buildEmailField(label: 'Email', hint: 'exemple@gmail.com'),
          SizedBox(height: SizeConfiguration.defaultSize / 4),
          buildPassField(label: 'Password', hint: '******'),
          SizedBox(
            height: SizeConfiguration.defaultSize / 4,
          ),
          buildConfirmPassField(label: 'Confirm Password', hint: '******'),
          SizedBox(
            height: SizeConfiguration.defaultSize / 4,
          ),
          FormError(
            errors: errors,
          ),
          customButton(textButton: 'Register'),
          SizedBox(
            height: SizeConfiguration.defaultSize / 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding:
                      EdgeInsets.only(right: SizeConfiguration.defaultSize / 4),
                  child: CircleAvatar(
                    child: Icon(Icons.facebook_rounded),
                    backgroundColor: Colors.grey[300],
                  )),
              CircleAvatar(
                child: SvgPicture.asset("assets/icons/google-icon.svg"),
                backgroundColor: Colors.grey[300],
              ),
              Padding(
                  padding:
                      EdgeInsets.only(left: SizeConfiguration.defaultSize / 4),
                  child: CircleAvatar(
                    child: SvgPicture.asset("assets/icons/twitter.svg"),
                    backgroundColor: Colors.grey[300],
                  )),
            ],
          ),
          SizedBox(
            height: SizeConfiguration.defaultSize,
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("do have an accoungt on cornucopia ?"),
                InkWell(
                  onTap: () =>
                      Navigator.pushReplacementNamed(context, SignIn.routeName),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontFamily: 'GloriaHallelujah',
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding suffixCustom(String svgIcon) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
      child: SvgPicture.asset(svgIcon),
    );
  }

  TextFormField buildEmailField({required String label, required String hint}) {
    return TextFormField(
      onSaved: (newValue) => _email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: suffixCustom("assets/icons/Mail.svg"),
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        labelText: label,
        hintText: hint,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.grey),
            gapPadding: 10),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.grey),
            gapPadding: 5),
      ),
    );
  }

  TextFormField buildPassField({
    required String label,
    required String hint,
  }) {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => setState(() {
        _password = newValue!;
      }),
      onChanged: (value) {
        setState(() {
          _password = value;
        });
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
          return;
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        suffixIcon: suffixCustom("assets/icons/Lock.svg"),
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: label,
        hintText: hint,
        enabledBorder: OutlineInputBorder(
            gapPadding: 05,
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.grey)),
        focusedBorder: OutlineInputBorder(
            gapPadding: 05,
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.grey)),
      ),
    );
  }

  TextFormField buildConfirmPassField({
    required String label,
    required String hint,
  }) {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => setState(() {
        _confirmPassword = newValue!;
      }),
      onChanged: (value) {
        setState(() {
          _confirmPassword = value;
        });
        if (value.isNotEmpty && errors.contains(kConfirmPassNullError)) {
          setState(() {
            errors.remove(kConfirmPassNullError);
          });
          return;
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kConfirmPassNullError)) {
          setState(() {
            errors.add(kConfirmPassNullError);
          });
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        suffixIcon: suffixCustom("assets/icons/Lock.svg"),
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: label,
        hintText: hint,
        enabledBorder: OutlineInputBorder(
            gapPadding: 05,
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.grey)),
        focusedBorder: OutlineInputBorder(
            gapPadding: 05,
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.grey)),
      ),
    );
  }

  Widget customButton({required String textButton}) {
    return SizedBox(
      height: 50,
      width: SizeConfiguration.defaultSize * 2,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
          Colors.deepOrangeAccent,
        )),
        onPressed: () async {
          if (_keyForm.currentState!.validate() &&
              _confirmPassword == _password) {
            _keyForm.currentState!.save();
            final url = Uri.parse('http://$SERVER_HOST:5000/user/signup');
            final headers = {'Content-Type': 'application/json'};
            final body = jsonEncode({'email': _email, 'password': _password});

            final response = await http.post(url, headers: headers, body: body);
            if (response.statusCode == 200) {
              Navigator.pushReplacementNamed(context, Home.routeName);
            } else if (response.statusCode == 409) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Email already exist'),
                  duration: Duration(seconds: 3),
                ),
              );
            }
          } else if (_confirmPassword != _password) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Password Entered Do Not Match'),
                duration: Duration(seconds: 3),
              ),
            );
          }
        },
        child: Text(
          "Register",
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'GloriaHallelujah',
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
