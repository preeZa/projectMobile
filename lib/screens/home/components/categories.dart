import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:projectMobile/screens/home/page/shirt_page.dart';

import '../../../constants.dart';
import '../../../models/Category.dart';
import '../menuScreen.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: demo_categories.length,
        itemBuilder: (context, index) => CategoryCard(
          icon: demo_categories[index].icon,
          title: demo_categories[index].title,
          press: () {
            if (index == 0) {
              // Navigator.pushNamed(context, "Shirtpage", arguments: "Dress");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Shirtpage("dress")));
              print("Dress");
            } else if (index == 1) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Shirtpage("shirt")));
              print("Shirt");
            } else if (index == 2) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Shirtpage("pants")));
              print("Pants");
            } else if (index == 3) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Shirtpage("hats")));
              print("Hats");
            }
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) =>
            //           MenuScreen(category: demo_categories[index]),
            //     ));
          },
        ),
        separatorBuilder: (context, index) =>
            const SizedBox(width: defaultPadding),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String icon, title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: press,
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: defaultPadding / 2, horizontal: defaultPadding / 4),
        child: Column(
          children: [
            SvgPicture.asset(icon),
            const SizedBox(height: defaultPadding / 2),
            Text(
              title,
              style: Theme.of(context).textTheme.subtitle2,
            )
          ],
        ),
      ),
    );
  }
}
