import 'package:berry/Common/Constant.dart';
import 'package:berry/Common/appbar.dart';
import 'package:berry/Common/bottomnavigation.dart';
import 'package:berry/Screeens/sideheading.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

ScrollController _scrollController = ScrollController();

class _HomeScreenState extends State<HomeScreen> {
  List lsImage = ['images/black_grapes.jpg', 'images/dragon.jpg', 'images/grapes.jpg', 'images/lemon.jpg'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          controller: _scrollController,
          physics: const ClampingScrollPhysics(), // Remove bounce physics

          primary: false,
          slivers: [
            SliverPersistentHeader(
              delegate: CustomSliverAppBarDelegate(expandedHeight: 200),
              pinned: true,
            ),
            buildbody()
          ],
        ),
        bottomNavigationBar: NextPage());
  }

  Widget buildbody() {
    int currentIndex = 0;
    Size size = MediaQuery.of(context).size;
    return SliverList(
      delegate: SliverChildListDelegate([
        Container(
            height: 30,
            decoration: BoxDecoration(
              color: Colors.transparent,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, -10),
                  blurRadius: 35,
                  color: kprimaryColor.withOpacity(0.38),
                )
              ],
            )),
        CarouselSlider.builder(
          itemCount: lsImage.length,
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) => GestureDetector(
            onTap: () {},
            child: Container(
                margin: EdgeInsets.only(left: kdefaultpadding, top: kdefaultpadding / 2, bottom: kdefaultpadding * 2.5),
                width: size.width * 0.8,
                //  height: 185,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(image: AssetImage(lsImage[itemIndex]), fit: BoxFit.cover),
                )),
          ),
          options: CarouselOptions(
            height: 200,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) => setState(() => currentIndex = index),
            scrollDirection: Axis.horizontal,
          ),
        ),
        TitleWithMoreButton(
          title: "Categories",
          press: () {},
        ),
      ]),
    );
  }
}
