import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:projectMobile/main.dart';
import 'package:http/http.dart' as http;
import '../../../Services.dart';
import '../../../constants.dart';
import '../../../models/products.dart';
import '../components/categories.dart';
import '../components/section_title.dart';

class Shirtpage extends StatefulWidget {
  String something;
  Shirtpage(this.something);

  @override
  State<StatefulWidget> createState() {
    return _ShirtpageState(this.something);
  }
}

class _ShirtpageState extends State<Shirtpage> {
  final _myBox = Hive.box("myBox");
  String something;
  _ShirtpageState(this.something);
  Products? products;

  String? title;
  bool isLoading = false;

  void initState() {
    super.initState();
    isLoading = true;
    title = 'Loading products...';

    products = Products();

    Services.getProducts().then((productsFromServer) {
      setState(() {
        products = productsFromServer;
        isLoading = false;
      });
    });
  }

  Future addProduct(int id_pro) async {
    final dataa = {
      "id_product": id_pro,
      "amount": 1,
      "id_user": _myBox.get('id_user')
    };
    String url = "http://192.168.1.5/mobileapi/basket";
    final reponse = await http.post(Uri.parse(url), body: jsonEncode(dataa));
    var data = reponse.body;

    if (reponse.statusCode == 200) {
      Navigator.pushNamed(context, "MyHomePage");
    }
  }

  @override
  Widget build(BuildContext context) {
    // String args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyHomePage()));
          },
          icon: SvgPicture.asset("assets/icons/back.svg"),
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_basket,
              color: Colors.black38,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "POPLPVESHOP",
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
            ),
            const Text(
              "best Outfits for you",
              style: TextStyle(fontSize: 18),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: defaultPadding),
            ),
            const Categories(),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40, left: 20),
                        child: SectionTitle(
                          title: something,
                        ),
                      ),
                      for (int i = 0; i < products!.products.length; i++)
                        if (products!.products[i].name == something)
                          SingleChildScrollView(
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            scrollDirection: Axis.horizontal,
                            child: Column(children: [
                              Container(
                                margin: EdgeInsets.only(
                                    top: 30, bottom: 30, left: 10, right: 10),
                                // padding: EdgeInsets.symmetric(horizontal: 20),
                                height: 350,
                                width: 320,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          products!.products[i].image),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              SizedBox(
                                child: Row(
                                  children: [
                                    Text(products!.products[i].name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black87)),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: defaultPadding),
                                    ),
                                    Text(products!.products[i].price.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.deepOrange,
                                                fontSize: 16)),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: defaultPadding),
                                    ),
                                    FloatingActionButton.extended(
                                      label: Text('Add Cart'),
                                      backgroundColor: Colors.brown,
                                      icon: Icon(
                                        Icons.shopping_bag_sharp,
                                        size: 24.0,
                                      ),
                                      onPressed: () {
                                        addProduct(products!
                                            .products[i].id_product
                                            .toInt());
                                      },
                                    ),
                                  ],
                                ),
                              )
                            ]
                                // List.generate(
                                //   products!.products.length,
                                //   (index) => Padding(
                                //     padding: const EdgeInsets.only(right: defaultPadding),
                                //     child: ProductCard(
                                //       title: "",
                                //       image: products!.products[index].image,
                                //       price: products!.products[index].price.toInt(),
                                //       bgColor: Color.fromARGB(255, 255, 255, 255),
                                //       press: () {
                                //         // Navigator.push(
                                //         //     context,
                                //         //     MaterialPageRoute(
                                //         //       builder: (context) =>
                                //         //           DetailsScreen(product: demo_product[index]),
                                //         //     ));
                                //       },
                                //     ),
                                //   ),
                                // ),
                                ),
                          )
                    ],
                  ),

            // const Shirtproduct(),
          ],
        ),
      ),
    );
  }
}
