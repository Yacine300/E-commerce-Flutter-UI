import 'package:flutter/cupertino.dart';

import 'RegisterForm.dart';

class FormulaireRegister extends StatelessWidget {
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
