import 'package:flutter/material.dart';

import 'categories_details.dart';

class ExpandContainer extends StatefulWidget {
  const ExpandContainer({
    Key? key,
  }) : super(key: key);

  @override
  _ExpandContainerState createState() => _ExpandContainerState();
}

class _ExpandContainerState extends State<ExpandContainer> {
  List categoriesDetails = [
    'images/9-apple.png',
    'images/1-strawberry.png',
    'images/19-orange.png',
    'images/4-grape.png',
    'images/1-2-mango.png',
    'images/2-2-guava.png',
    'images/5-pomegranate.png',
    'images/8-banana.png',
  ];
  List categoriesName = [
    'Apple',
    'Strawberry',
    'Orange',
    'Grape',
    'Mango',
    'Guva',
    'Pomegranate',
    'Banana',
  ];

  bool limitedshow = true;
  // void initState() {
  //   if (widget.categoriesDetails.length > 16) {
  //     setState(() {
  //       limitedshow = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final middle = categoriesDetails.length ~/ 2;
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(children: [
        GridView.builder(
            //controller: _scrollController,
            padding:
                const EdgeInsets.only(left: 8, right: 8, top: 10, bottom: 3),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 15,
              childAspectRatio: MediaQuery.of(context).size.height / 1100,
            ),
            physics: NeverScrollableScrollPhysics(),
            itemCount: limitedshow
                ? categoriesDetails.length
                : (categoriesDetails.sublist(0, middle)).length,
            itemBuilder: (BuildContext context, index) {
              // if (index == widget.categoriesdetails.length) {
              //   return CircularProgressIndicator();
              // } else {
              return Column(children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoriesRoute(
                                  lsImage: 'images/9-apple.png',
                                  lsTitle: 'Apple',
                                )));
                  },
                  child: Container(
                      // height: 50,
                      // width: 50,
                      decoration: BoxDecoration(
                          color: Colors.grey[200], shape: BoxShape.circle),
                      padding: const EdgeInsets.all(8),
                      child: Image.asset(
                        categoriesDetails[index],
                        fit: BoxFit.cover,
                      )),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 4),
                  child: Text(
                    categoriesName[index],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    //maxLines: 50,
                    // overflow: OverflowBox,
                    style:
                        TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold),
                  ),
                ),
              ]);
            }),
      ]),
    );
    ;
  }
}
