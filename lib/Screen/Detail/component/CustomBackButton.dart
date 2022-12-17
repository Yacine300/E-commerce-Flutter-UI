import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one/Composant/SizeConfig.dart';

class CustomBackButton extends StatelessWidget {
  @override
  const CustomBackButton();
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: SizeConfiguration.defaultSize / 2,
      width: SizeConfiguration.defaultSize / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Colors.white,
      ),
      child: Center(
          child: BackButton(
        onPressed: () => Navigator.pop(context),
      )),
    );
  }
}
