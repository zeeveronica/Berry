import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'Constant.dart';

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  const CustomSliverAppBarDelegate({
    required this.expandedHeight,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final size = 60;
    final top = expandedHeight - shrinkOffset - size / 2;

    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        buildAppbarBackground(shrinkOffset),
        buildAppBar(shrinkOffset),
        Positioned(
          bottom: 40,
          left: 20,
          right: 20,
          child: Row(
            children: [
              Text(
                'Hi Botanic!',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Spacer(),
              ClipOval(
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  "images/berry_logo.jpg",
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: top,
          left: 20,
          right: 20,
          child: buildSearchbox(shrinkOffset, context),
        ),
      ],
    );
  }

  double appear(double shrinkOffset) => shrinkOffset / expandedHeight;

  double disappear(double shrinkOffset) => 1 - shrinkOffset / expandedHeight;

  Widget buildAppBar(double shrinkOffset) => Opacity(
        opacity: appear(shrinkOffset),
        child: AppBar(
          backgroundColor: Colors.white,
          title: TextFormField(
            decoration: InputDecoration(
              hintText: "Search products and categories",
              hintStyle: TextStyle(fontSize: 15, color: Colors.black),
              suffixIcon: Icon(
                Icons.search_rounded,
                size: 30,
                color: kprimaryColor,
              ),
              isDense: true,
              contentPadding: EdgeInsets.fromLTRB(20, 20, 10, 0),
            ),
          ),
          centerTitle: true,
        ),
      );

  Widget buildAppbarBackground(double shrinkOffset) => Opacity(
      opacity: disappear(shrinkOffset),
      child: AppBar(
        backgroundColor: kprimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(36),
          ),
        ),
        title: Text(
          '𝓑𝓮𝓻𝓻𝔂',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40),
        ),
        titleTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ));

  Widget buildSearchbox(double shrinkOffset, BuildContext context) => Opacity(
        opacity: disappear(shrinkOffset),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.only(left: 5.0, top: 2, right: 0, bottom: 5),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              height: 50,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Search products and categories",
                  hintStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    size: 30,
                    color: kprimaryColor,
                  ),
                  isDense: true,
                  //contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: HexColor("#F0F0F0"),
                ),
              ),
            ),
          ),
        ]),
      );

  Widget buildButton({
    required String text,
    required IconData icon,
  }) =>
      TextButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(width: 12),
            Text(text, style: TextStyle(fontSize: 20)),
          ],
        ),
        onPressed: () {},
      );

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + 30;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
