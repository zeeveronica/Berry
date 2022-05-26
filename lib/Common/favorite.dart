import 'package:flutter/material.dart';

import 'Constant.dart';

class Favouritebutton extends StatefulWidget {
  const Favouritebutton({
    Key? key,
    required this.AddCartFavorite,
  }) : super(key: key);
  final bool AddCartFavorite;
  @override
  State<Favouritebutton> createState() => _FavouritebuttonState();
}

bool isFavorite = false;

class _FavouritebuttonState extends State<Favouritebutton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () {
      setState(() {
        isFavorite = !isFavorite;
      });

      widget.AddCartFavorite
          ? Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: kprimaryColor),
                  borderRadius: BorderRadius.circular(5.0)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: kprimaryColor,
                ),
              ),
            )
          : Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(1, 1), color: Colors.grey, blurRadius: 2)
                  ],
                  color: Colors.white),
              height: 30,
              width: 30,
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? kprimaryColor : kprimaryColor,
              ),
            );
    });
    ;
  }
}
