import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../Services.dart';
import '../../../constants.dart';
import '../../../models/product.dart';
import '../../../models/products.dart';
import '../../details/details_screen.dart';
import 'product_card.dart';
import 'section_title.dart';

class NewArrivalProducts extends StatefulWidget {
  const NewArrivalProducts({Key? key}) : super(key: key);

  @override
  State<NewArrivalProducts> createState() => _NewArrivalProductsState();
}

class _NewArrivalProductsState extends State<NewArrivalProducts> {
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

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 20),
                child: SectionTitle(
                  title: "ALL",
                  pressSeeAll: () {},
                ),
              ),
              for (int i = 0; i < products!.products.length; i++)
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
                            image: NetworkImage(products!.products[i].image),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    SizedBox(
                      child: Row(
                        children: [
                          Text("Shirt",
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
                          Text("250 Bath",
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
                            onPressed: () {},
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
          );
  }
}
