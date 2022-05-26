import 'package:badges/badges.dart';
import 'package:berry/Common/Constant.dart';
import 'package:berry/Screeens/recommamend_products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CategoriesRoute extends StatefulWidget {
  final String lsImage;
  final String lsTitle;

  const CategoriesRoute({
    Key? key,
    required this.lsImage,
    required this.lsTitle,
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
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
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
                    mainAxisSpacing: 15,
                    childAspectRatio: MediaQuery.of(context).size.height / 1100,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return const RecommedPlantCard(
                      images: "images/1-2-avocado.png",
                      name: "Avocado",
                      country: "India",
                      price: 250,
                      description:
                          'Avocado fruits have greenish or yellowish flesh with a buttery consistency and a rich nutty flavour. They are often eaten in salads, and in many parts of the world they are eaten as a dessert. Mashed avocado is the principal ingredient of guacamole, a characteristic saucelike condiment in Mexican cuisine',
                      quantity: '1 Kg',
                    );
                  })
            ]),
      ),
    ));
  }
}
