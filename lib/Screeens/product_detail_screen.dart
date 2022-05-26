import 'package:badges/badges.dart';
import 'package:berry/Common/Constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailedScreen extends StatefulWidget {
  const DetailedScreen(
      {Key? key,
      required this.image,
      required this.name,
      required this.price,
      required this.quantity,
      required this.description})
      : super(key: key);
  final String image;
  final String name;
  final double price;
  final String quantity;
  final String description;
  @override
  _DetailedScreenState createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  late double totalPrice;
  int count = 1;
  bool addCArtClick = false;
  bool favorite = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimaryColor.withOpacity(0.11),
        shadowColor: kprimaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    favorite == false
                        ? IconButtons(Icons.favorite_border, () {
                            setState(() {
                              favorite = true;
                            });
                          })
                        : IconButtons(Icons.favorite, () {
                            setState(() {
                              favorite = !favorite;
                            });
                          }),
                    SizedBox(
                      height: 90,
                    ),
                    Badge(
                        badgeContent: Text(
                          '${count}',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        elevation: 0,
                        badgeColor: kprimaryColor,
                        position: BadgePosition.topEnd(top: 2, end: 1),
                        child: IconButtons(Icons.shopping_cart, () {})),
                    SizedBox(
                      height: 85,
                    ),
                    productPrice(" Q:" + widget.quantity.toString()),
                    SizedBox(
                      height: 80,
                    ),
                    productPrice("₹" + widget.price.toString()),
                  ],
                )),
                Container(
                  height: size.height * 0.7,
                  width: size.width * 0.75,
                  decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(63),
                          bottomLeft: const Radius.circular(63)),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 60,
                            color: kprimaryColor.withOpacity(0.23))
                      ],
                      image: DecorationImage(
                          //alignment: Alignment.center,
                          fit: BoxFit.fitWidth,
                          image: AssetImage(widget.image))),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 30),
              child: Text(widget.name,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 30, right: 1),
              child: Text(widget.description,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 20, right: 20),
                child: Row(children: [
                  addCArtClick == false || count == 0
                      ? Visibility(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(20, 50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(22.0)),
                                  primary: kprimaryColor,
                                  padding: EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                      top: 10,
                                      bottom: 10)),
                              onPressed: () {
                                setState(() {
                                  addCArtClick = true;
                                  count++;
                                });
                              },
                              child: const Text(
                                'AddCart',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              )))
                      : Row(
                          children: [
                            IconButtons(Icons.add, () {
                              setState(() {
                                count++;
                              });
                            }),
                            SizedBox(
                              width: 10,
                            ),
                            productPrice("${count}"),
                            SizedBox(
                              width: 10,
                            ),
                            IconButtons(Icons.remove, () {
                              if (count > 0) {
                                setState(() {
                                  count--;
                                });
                              }
                            }),
                            SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                  Spacer(),
                  TotalPrice(),
                ])),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 40, bottom: 50),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(20, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.0)),
                      primary: kprimaryColor,
                      padding: EdgeInsets.only(
                          left: 130, right: 130, top: 10, bottom: 10)),
                  onPressed: () {},
                  child: Text(
                    'Checkout',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  )),
            )
          ],
        ),
      ),
    );
  }

  Text TotalPrice() {
    totalPrice = count * widget.price;
    return Text('₹' + " " + totalPrice.toString(),
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: kprimaryColor));
  }

  Container productPrice(String text) {
    return Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 10), blurRadius: 60, color: Colors.grey)
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: kprimaryColor),
          ),
        ));
  }

  Container IconButtons(
    IconData icon,
    Function() press,
  ) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(offset: Offset(0, 10), blurRadius: 60, color: Colors.grey)
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: IconButton(
        onPressed: press,
        icon: Icon(
          icon,
          size: 30,
          color: kprimaryColor,
        ),
      ),
    );
  }
}
