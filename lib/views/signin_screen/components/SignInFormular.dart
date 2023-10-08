import 'package:flutter/material.dart';

import 'SignFormField.dart';

class FormulaireSignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              SignForm(),
            ],
          ),
        ));
  }
}
