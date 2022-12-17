import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one/Composant/Constant.dart';
import 'package:one/Composant/SizeConfig.dart';
import 'package:one/Screen/Sign_In/Sign_in_screen.dart';
import 'package:one/Screen/Register/Register_screen.dart';

class Intro extends StatelessWidget {
  static String routeName = "/intro.dart";
  @override
  Widget build(BuildContext context) {
    SizeConfiguration().init(context);
    return Scaffold(
      appBar: monAppbar(context: context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SpeechIntro(),
          ImageIntro(),
          SizedBox(
            height: SizeConfiguration.defaultSize / 3,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfiguration.defaultSize / 5),
            child: Column(
              children: [
                customButton(
                    textButton: "Sign in",
                    context: context,
                    routeName: SignIn.routeName),
                Text(
                  "or",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w300),
                ),
                secondCustomButton(
                    textButton: "Register",
                    context: context,
                    routeName: Register.routeName),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget secondCustomButton(
      {@required String textButton,
      @required BuildContext context,
      @required String routeName,
      Color couleur}) {
    return SizedBox(
        height: SizeConfiguration.defaultSize / 2,
        width: SizeConfiguration.defaultSize * 2,
        child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
              side: BorderSide(color: Colors.deepOrangeAccent)),
          onPressed: () => Navigator.pushNamed(context, routeName),
          child: Text(
            textButton,
            style: TextStyle(
                color: Colors.deepOrangeAccent,
                fontSize: 20,
                fontFamily: 'roboto',
                fontWeight: FontWeight.bold),
          ),
          color: Colors.white,
        ));
  }

  Widget customButton(
      {@required String textButton,
      @required BuildContext context,
      @required String routeName,
      Color couleur}) {
    return SizedBox(
        height: SizeConfiguration.defaultSize / 2,
        width: SizeConfiguration.defaultSize * 2,
        child: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          onPressed: () => Navigator.pushNamed(context, routeName),
          child: Text(
            textButton,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'roboto',
                fontWeight: FontWeight.bold),
          ),
          color: Colors.deepOrangeAccent,
        ));
  }

  AppBar monAppbar({BuildContext context}) {
    return AppBar(
      //title: Text("${SizeConfiguration.defaultSize}"),
      backgroundColor: couleurPricipal,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: SvgPicture.asset("assets/icons/exit.svg"),
      ),
    );
  }
}

class ImageIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AspectRatio(
        child: Image.asset("assets/images/login.png"),
        aspectRatio: 1.2,
      ),
    );
  }
}

class SpeechIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizeConfiguration.defaultSize / 5),
      child: SizedBox(
        width: SizeConfiguration.screenWidth / 1.5,
        height: SizeConfiguration.defaultSize * 1.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Discover your product",
              maxLines: 2,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            Text(
              "explore all the most exiting product and marks based on your favorite  flavour",
              style: TextStyle(fontSize: 13, color: Colors.grey),
              maxLines: 4,
            )
          ],
        ),
      ),
    );
  }
}
