import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

import 'package:one/models/Product.dart';
import 'package:one/Composant/SizeConfig.dart';
import 'package:one/Screen/Detail/details.dart';
import 'package:one/providers/products.dart';
import 'package:http/http.dart' as http;

import 'package:provider/provider.dart';

import '../../../Composant/server_host.dart';
import 'ChampAction.dart';
import 'HomeCategories.dart';
import 'HomeHeader.dart';
import 'HomePub.dart';
import 'SpecialOffreCard.dart';

List<Product>? product = [];

class HomeBody extends StatefulWidget {
  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    super.initState();
    fetchProductData();
  }

  Future<void> fetchProductData() async {
    final productData = Provider.of<Products>(context, listen: false);
    await productData.fetchProduct();

    setState(() {
      product = productData.items;
    });
  }

  String uri = "http://$SERVER_HOST:5000/";
  @override
  Widget build(BuildContext context) {
    SizeConfiguration().init(context);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            DelayedDisplay(
                slidingCurve: Curves.ease,
                slidingBeginOffset: Offset(0, 0),
                delay: Duration(milliseconds: 700),
                child: const HomeHeader()),
            SizedBox(height: getProportionateScreenHeight(40)),
            DelayedDisplay(
                slidingCurve: Curves.ease,
                slidingBeginOffset: Offset(0, 0),
                delay: Duration(milliseconds: 1000),
                child: const Pub()),
            SizedBox(height: getProportionateScreenHeight(20)),
            DelayedDisplay(
                slidingCurve: Curves.ease,
                slidingBeginOffset: Offset(0, 0),
                delay: Duration(milliseconds: 1300),
                child: const Categories()),
            SizedBox(height: getProportionateScreenHeight(20)),
            DelayedDisplay(
              slidingCurve: Curves.ease,
              slidingBeginOffset: Offset(0, 0),
              delay: Duration(milliseconds: 1600),
              child: ChampAction(
                bigText: 'Special for you',
                seeAll: "see all",
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            DelayedDisplay(
              slidingCurve: Curves.ease,
              slidingBeginOffset: Offset(0, 0),
              delay: Duration(milliseconds: 1600),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SpecialOfferCard(
                      image: "assets/images/ImageBanner2.png",
                      category: "Smartphone",
                      numOfBrands: 18,
                      press: () {},
                    ),
                    SpecialOfferCard(
                      image: "assets/images/ImageBanner3.png",
                      category: "Fashion",
                      numOfBrands: 24,
                      press: () {},
                    ),
                    SizedBox(width: getProportionateScreenWidth(20)),
                  ],
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            ChampAction(
              bigText: "Popular",
              seeAll: "see all",
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: product!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: (SizeConfiguration.defaultSize /
                        SizeConfiguration.defaultSize /
                        1.5),
                    mainAxisSpacing: SizeConfiguration.defaultSize / 3,
                    crossAxisSpacing: SizeConfiguration.defaultSize / 3,
                  ),
                  itemBuilder: (context, index) =>
                      buildDiscoverItem(product![index])),
            )
          ],
        ),
      ),
    );
  }

  Widget buildDiscoverItem(Product product) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Details(
                    produit: product.id,
                  )),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7), color: Colors.grey[200]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                width: SizeConfiguration.defaultSize +
                    SizeConfiguration.defaultSize / 3,
                height: SizeConfiguration.defaultSize +
                    SizeConfiguration.defaultSize / 3,
                child: Hero(
                    tag: product.id,
                    child: Image.network(
                      uri + product.imagesProduit[0],
                      fit: BoxFit.contain,
                    ))),
            Text(
              product.nom,
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                '${product.prix} \$',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            InkWell(
              child: Container(
                child: Center(
                  child: (const Text(
                    "+",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontFamily: 'GloriaHallelujah'),
                  )),
                ),
                height: SizeConfiguration.defaultSize / 2.5,
                width: SizeConfiguration.defaultSize / 2.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.deepOrangeAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
