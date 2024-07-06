import 'package:flutter/material.dart';
import 'package:one/Composant/SizeConfig.dart';

class Pub extends StatelessWidget {
  @override
  const Pub();
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: SizeConfiguration.defaultSize * 3,
                width: SizeConfiguration.defaultSize * 3.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/BlackFriday.gif'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10),
                ),

                /*Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      /*  const Text(
                          "November surprise",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),*/
                       /* const Text(
                          "Cachback 35%",
                          style: TextStyle(
                              fontSize: 32,
                              color: Colors.white,
                              fontFamily: 'GloriaHallelujah',
                              fontWeight: FontWeight.bold),
                        ),*/
                      ],
                    ),*/
              ),
            ],
          )
        ],
      ),
    );
  }
}
