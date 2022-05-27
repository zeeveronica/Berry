import 'package:badges/badges.dart';
import 'package:berry/Common/Constant.dart';
import 'package:berry/Screeens/product_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CategoriesRoute extends StatefulWidget {
  final String lsImage;
  final String lsTitle;
  final String productImage;
  final String productName;
  const CategoriesRoute({
    Key? key,
    required this.lsImage,
    required this.lsTitle,
    required this.productImage,
    required this.productName,
  }) : super(key: key);

  @override
  _CategoriesRouteState createState() => _CategoriesRouteState();
}

class _CategoriesRouteState extends State<CategoriesRoute> {
  bool _isAppbar = true;
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        appBarStatus(false);
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        appBarStatus(true);
      }
    });
  }

  void appBarStatus(bool status) {
    setState(() {
      _isAppbar = status;
    });
  }

  bool isOpen = true;
  toggleOpen() {
    setState(() {
      isOpen = !isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: AnimatedContainer(
            height: _isAppbar ? 80.0 : 90.0,
            duration: Duration(milliseconds: 300),
            child: _isAppbar
                ? AppBar(
                    backgroundColor: kprimaryColor.withOpacity(0.15),
                    elevation: 0,
                    iconTheme: IconThemeData(color: kprimaryColor),
                    leading: BackButton(color: kprimaryColor),
                  )
                : isOpen
                    ? AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        iconTheme: IconThemeData(color: kprimaryColor),
                        title: Text(
                          widget.lsTitle,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        actions: [
                          IconButton(
                            onPressed: () {
                              toggleOpen();
                            },
                            icon: Icon(Icons.search_sharp),
                          ),
                          Badge(
                            badgeContent: const Text(
                              '99+',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            elevation: 0,
                            badgeColor: kprimaryColor,
                            position: BadgePosition.topEnd(top: 2, end: 1),
                            child: IconButton(
                              onPressed: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => AddBasket()));
                              },
                              icon: Icon(
                                Icons.shopping_cart_outlined,
                                color: kprimaryColor,
                              ),
                            ),
                          ),
                        ],
                      )
                    : AppBar(
                        backgroundColor: Colors.white,
                        elevation: 0,
                        iconTheme: IconThemeData(color: kprimaryColor),
                        title: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search...",
                            hintStyle:
                                TextStyle(fontSize: 18, color: Colors.black),
                            isDense: true,
                          ),
                        ),
                        actions: [
                          IconButton(
                            onPressed: () {
                              toggleOpen();
                            },
                            icon: const Icon(Icons.close),
                          ),
                        ],
                      ),
          )),
      // appBar: App,
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: ScrollPhysics(),
        // primary: true,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  height: 250,
                  decoration: BoxDecoration(
                    color: kprimaryColor.withOpacity(0.15),
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(
                            MediaQuery.of(context).size.width, 50.0)),
                  ),
                  child: Stack(children: [
                    Positioned(
                      right: -50,
                      bottom: 10,
                      child: Image.asset(
                        widget.lsImage,
                        width: 300,
                        height: 240,
                      ),
                    ),
                    Positioned(
                        left: 20,
                        bottom: 30,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.lsTitle,
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ))
                  ])),
              SizedBox(
                height: 20,
              ),
              GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 25,
                    childAspectRatio: MediaQuery.of(context).size.height / 750,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return CategoriesProduct(
                      images: widget.productImage,
                      names: widget.productName,
                      index: index,
                    );
                  })
            ]),
      ),
    ));
  }
}

class CategoriesProduct extends StatefulWidget {
  final String images;
  final String names;
  final int index;
  const CategoriesProduct(
      {Key? key,
      required this.images,
      required this.names,
      required this.index})
      : super(key: key);

  @override
  State<CategoriesProduct> createState() => _CategoriesProductState();
}

class _CategoriesProductState extends State<CategoriesProduct> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailedScreen(
                      image: widget.images,
                      name: widget.names,
                      price: 200.0,
                      description:
                          'The deciduous leaves are borne alternately on long petioles (leaf stems), and young leaves are covered with reddish hairs.',
                      quantity: " 1 kg",
                    )));
      },
      child: Container(
        // height: 400,
        margin: EdgeInsets.only(
          // top: kdefaultpadding / 2,
          left: kdefaultpadding - 10,
          right: kdefaultpadding - 10,
          //bottom: kdefaultpadding * 2.5
        ),
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
//height: size.height*0.4,
        width: size.width * 0.4,
        child: Column(
          children: [
            Image.asset(
              widget.images,
              height: 100,
              width: size.width * 0.4,
              fit: BoxFit.fitWidth,
            ),
            Container(
              padding: EdgeInsets.all(kdefaultpadding / 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: kprimaryColor.withOpacity(0.23),
                        offset: Offset(0, 10),
                        blurRadius: 50)
                  ]),
              child: Column(
                children: [
                  Text(widget.names.toUpperCase(),
                      style: Theme.of(context).textTheme.button),
                  Row(children: [
                    Badge(
                      badgeContent: Text(
                        '',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      elevation: 0,
                      badgeColor: kprimaryColor,
                      position: BadgePosition.topEnd(top: 2, end: 1),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.shopping_cart,
                          size: 30,
                          color: kprimaryColor,
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      "₹ 450",
                      style: Theme.of(context)
                          .textTheme
                          .button!
                          .copyWith(color: kprimaryColor),
                    )
                  ]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
