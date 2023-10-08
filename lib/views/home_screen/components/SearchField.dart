import 'package:flutter/material.dart';
import 'package:one/utils/size_config.dart';

class SearchField extends StatelessWidget {
  const SearchField();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfiguration.defaultSize * 2.5,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(7),
      ),
      child: TextField(
        onChanged: (value) => print(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(2)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Search product",
            prefixIcon: Icon(
              Icons.search_outlined,
              color: Colors.grey[600],
            )),
      ),
    );
  }
}
