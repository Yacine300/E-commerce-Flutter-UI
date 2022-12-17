import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one/Composant/Constant.dart';
import 'package:one/Composant/SizeConfig.dart';
import 'package:one/Screen/Home/Home.dart';
import 'package:one/Screen/Register/Register_screen.dart';

import 'SignInBody.dart';

class SignForm extends StatefulWidget {
  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _keyForm = GlobalKey<FormState>();

  List<String> errors = [];
  String _email, _password;
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
          Row(
            children: [
              Checkbox(
                value: remember,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text("remember me"),
              Spacer(),
              Text(
                "Frgot password",
                style: TextStyle(decoration: TextDecoration.underline),
              )
            ],
          ),
          SizedBox(
            height: SizeConfiguration.defaultSize / 4,
          ),
          FormError(
            errors: errors,
          ),
          customButton(textButton: 'Sign in'),
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
                Text("you dont have an account yet ?"),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, Register.routeName),
                  child: Text(
                    "Register",
                    style: TextStyle(
                        color: Colors.deepOrangeAccent,
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

  Padding suffixCustom({String svgIcon}) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
      child: SvgPicture.asset(svgIcon),
    );
  }

  TextFormField buildEmailField(
      {@required String label, @required String hint}) {
    return TextFormField(
      onSaved: (newValue) => _email = newValue,
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
        if (value.isEmpty && !errors.contains(kEmailNullError)) {
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
        suffixIcon: suffixCustom(svgIcon: "assets/icons/Mail.svg"),
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

  TextFormField buildPassField(
      {@required String label, @required String hint}) {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => _password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
          return "";
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        suffixIcon: suffixCustom(svgIcon: "assets/icons/Lock.svg"),
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

  Widget customButton({@required String textButton}) {
    return FlatButton(
      height: SizeConfiguration.defaultSize / 2,
      onPressed: () {
        if (_keyForm.currentState.validate()) {
          _keyForm.currentState.save();
          Navigator.pushNamed(context, Home.routeName);
        }
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Text(textButton,
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'roboto',
              fontWeight: FontWeight.bold)),
      color: Colors.deepOrangeAccent,
    );
  }
}
