import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';
import '../components/categories.dart';


// import '../screens/home/components/categories/categories.dart';

// import '../screens/home/components/categories/pants.dart';

class Pantpage extends StatefulWidget {
  const Pantpage({Key? key}) : super(key: key);

  @override
  State<Pantpage> createState() => _PantpageState();
}

class _PantpageState extends State<Pantpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/menu.svg"),
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
              "POPLOVESHOP",
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
            const SizedBox(height: 20),
            // const Pantproduct(),
          ],
        ),
      ),
    );
  }
}
