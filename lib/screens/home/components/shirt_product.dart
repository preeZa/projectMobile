// import 'package:flutter/material.dart';


// import '../../../constants.dart';
// import '../../../models/Product.dart';
// import '../../details/details_screen.dart';
// import 'product_card.dart';
// import 'section_title.dart';

// class ShirtProducts extends StatefulWidget {
//   const ShirtProducts({Key? key}) : super(key: key);

//   @override
//   State<ShirtProducts> createState() => _ShirtProductsState();
// }

// class _ShirtProductsState extends State<ShirtProducts> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: defaultPadding),
//           child: SectionTitle(
//             title: demo_product[2].title,
//             pressSeeAll: () {},
//           ),
//         ),
//         SingleChildScrollView(
//           physics: const BouncingScrollPhysics(
//               parent: AlwaysScrollableScrollPhysics()),
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children: List.generate(
//               demo_product.length,
//               (index) => Padding(
//                 padding: const EdgeInsets.only(right: defaultPadding),
//                 child: ProductCard(
//                   title: demo_product[index].title,
//                   image: demo_product[index].image,
//                   price: demo_product[index].price,
//                   bgColor: demo_product[index].bgColor,
//                   press: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) =>
//                               DetailsScreen(product: demo_product[index]),
//                         ));
//                   },
//                 ),
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
