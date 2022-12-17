import 'package:flutter/material.dart';
import 'package:one/Composant/SizeConfig.dart';

class SearchField extends StatelessWidget {
  const SearchField();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfiguration.screenWidth * 0.6,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (value) => print(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(20)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Search product",
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }
}
