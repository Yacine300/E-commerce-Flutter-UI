import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one/Composant/SizeConfig.dart';

import 'IntroSignIn.dart';
import 'SignInFormular.dart';

class SignInBody extends StatefulWidget {
  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    SizeConfiguration().init(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          IntroSignIn(),
          FormulaireSignIn(),
        ],
      ),
    );
  }
}

class FormError extends StatelessWidget {
  final List<String> errors;

  FormError({this.errors});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => formError(error: errors[index])),
    );
  }

  formError({error}) {
    return Row(
      children: [
        SvgPicture.asset("assets/icons/exit.svg"),
        SizedBox(
          width: SizeConfiguration.defaultSize / 4,
        ),
        Text(error)
      ],
    );
  }
}
