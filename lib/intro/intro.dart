import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one/Composant/Constant.dart';
import 'package:one/Composant/SizeConfig.dart';
import 'package:one/Composant/defaultAppbar.dart';
import 'package:one/Screen/Sign_In/Sign_in_screen.dart';
import 'package:one/Screen/Register/Register_screen.dart';

class Intro extends StatelessWidget {
  static String routeName = "/intro.dart";
  @override
  Widget build(BuildContext context) {
    SizeConfiguration().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppbar(title: ''),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpeechIntro(),
            ImageIntro(),
            SizedBox(
              height: 25,
            ),
            Column(
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
          ],
        ),
      ),
    );
  }

  Widget secondCustomButton(
      {required String textButton,
      required BuildContext context,
      required String routeName,
      Color? couleur}) {
    return DelayedDisplay(
      delay: Duration(milliseconds: 900),
      slidingBeginOffset: Offset(0, 0),
      slidingCurve: Curves.ease,
      child: SizedBox(
        height: 50,
        width: SizeConfiguration.defaultSize * 2,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
            Colors.deepOrangeAccent,
          )),
          onPressed: () => Navigator.pushReplacementNamed(context, routeName),
          child: Text(
            "Register",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'GloriaHallelujah',
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget customButton(
      {required String textButton,
      required BuildContext context,
      required String routeName,
      Color? couleur}) {
    return DelayedDisplay(
      delay: Duration(milliseconds: 900),
      slidingBeginOffset: Offset(0, 0),
      slidingCurve: Curves.ease,
      child: SizedBox(
        height: 50,
        width: SizeConfiguration.defaultSize * 2,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
            Colors.deepOrangeAccent,
          )),
          onPressed: () => Navigator.pushReplacementNamed(context, routeName),
          child: Text(
            "login",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'GloriaHallelujah',
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  AppBar monAppbar({BuildContext? context}) {
    return AppBar(
      //title: Text("${SizeConfiguration.defaultSize}"),
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context!),
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
    return SizedBox(
      width: SizeConfiguration.screenWidth * 0.65,
      height: SizeConfiguration.defaultSize * 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText('Discover your product',
                  textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      fontFamily: 'GloriaHallelujah'),
                  speed: Duration(milliseconds: 100)),
            ],
            totalRepeatCount: 1,
          ),
          SizedBox(height: 20),
          Text(
            "explore all the most exiting product and marks based on your favorite  flavour",
            style: TextStyle(fontSize: 13, color: Colors.grey),
            maxLines: 4,
          ),
        ],
      ),
    );
  }
}
