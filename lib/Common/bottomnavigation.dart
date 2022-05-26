import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'Constant.dart';

class NextPage extends StatefulWidget {
  const NextPage({
    Key? key,
  }) : super(key: key);

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -10),
              blurRadius: 35,
              color: kprimaryColor.withOpacity(0.38),
            )
          ],
        ),
        child: GNav(
          rippleColor: Colors.red,
          hoverColor: Colors.red,
          gap: 8,
          activeColor: Colors.white,
          iconSize: 24,
          tabBackgroundColor: kprimaryColor,
          color: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          tabs: const [
            GButton(
              icon: Icons.apps,
              text: 'Home',
              textColor: Colors.white,
            ),
            GButton(
              icon: Icons.favorite_border,
              text: 'Favourite',
              textColor: Colors.white,
            ),
            GButton(
              icon: Icons.shopping_cart,
              text: 'Cart',
              textColor: Colors.white,
            ),
            GButton(
                icon: Icons.settings,
                text: 'Settings',
                textColor: Colors.white),
          ],
        ));
  }
}
