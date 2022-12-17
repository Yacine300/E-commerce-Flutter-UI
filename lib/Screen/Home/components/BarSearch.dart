import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one/Composant/SizeConfig.dart';

class BarSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: SizeConfiguration.defaultSize / 4),
      child: Container(
        height: SizeConfiguration.defaultSize / 2,
        width: SizeConfiguration.defaultSize * 2.2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.grey[200]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfiguration.defaultSize / 4),
              child: SvgPicture.asset(
                "assets/icons/loop.svg",
                color: Colors.grey[500],
              ),
            ),
            Text(
              "search product",
              style: TextStyle(color: Colors.grey[500]),
            )
          ],
        ),
      ),
    );
  }
}
