import 'package:flutter/material.dart';

import 'package:one/utils/size_config.dart';

import 'components/StartBody.dart';
import '../components/default_app_bar.dart';

class Start extends StatelessWidget {
  static String routeName = "/Start.dart";
  @override
  Widget build(BuildContext context) {
    SizeConfiguration().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: DefaultAppbar(
        title: "",
      ),
      body: StartBody(),
    );
  }
}
