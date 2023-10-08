import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one/utils/size_config.dart';

class BarSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: SizeConfiguration.defaultSize * 0.2, left: 0.2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/icons/loop.svg",
            color: Colors.grey[500],
          ),
          Text(
            "search product",
            style: TextStyle(color: Colors.grey[500]),
          )
        ],
      ),
    );
  }
}
