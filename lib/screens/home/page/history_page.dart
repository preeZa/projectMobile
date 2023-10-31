import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../../../constants.dart';

// import '../screens/home/components/History_order/order_history.dart';

class Historypage extends StatefulWidget {
  const Historypage({Key? key}) : super(key: key);

  @override
  State<Historypage> createState() => _HistorypageState();
}

class _HistorypageState extends State<Historypage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/menu.svg"),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SvgPicture.asset("assets/icons/Location.svg"),
            const SizedBox(width: defaultPadding / 2),
            Text(
              "History Order",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset("assets/icons/Notification.svg"),
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
              "POPLOVE SHOP",
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
            ),
            const Text(
              "Your Order",
              style: TextStyle(fontSize: 18),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: defaultPadding),
            ),
            // const Categories(),
            // const OrderhistoryProducts(),
            // const OrderhistoryProducts(),
            // const OrderhistoryProducts(),
            // const PopularProducts(),
          ],
        ),
      ),
    );
  }
}
