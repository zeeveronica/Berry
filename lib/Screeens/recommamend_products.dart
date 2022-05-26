import 'package:badges/badges.dart';
import 'package:berry/Common/Constant.dart';
import 'package:berry/Screeens/product_detail_screen.dart';
import 'package:flutter/material.dart';

class RecommendPlant extends StatefulWidget {
  const RecommendPlant({
    Key? key,
  }) : super(key: key);

  @override
  State<RecommendPlant> createState() => _RecommendPlantState();
}

class _RecommendPlantState extends State<RecommendPlant> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: const [
        RecommedPlantCard(
          images: "images/1-2-avocado.png",
          name: "Avocado",
          country: "India",
          price: 250,
          description:
              'Avocado fruits have greenish or yellowish flesh with a buttery consistency and a rich nutty flavour. They are often eaten in salads, and in many parts of the world they are eaten as a dessert. Mashed avocado is the principal ingredient of guacamole, a characteristic saucelike condiment in Mexican cuisine',
          quantity: '1 Kg',
        ),
        RecommedPlantCard(
          images: "images/2-2-guava.png",
          name: "Guava",
          country: "India",
          price: 200,
          description:
              'The fruit has a yellow skin and white, yellow, or pink flesh. The musky, at times pungent, odour of the sweet pulp is not always appreciated.',
          quantity: '1 Kg',
        ),
        RecommedPlantCard(
          images: "images/3-kiwi.png",
          name: "Kiwi",
          country: "India",
          price: 300,
          description:
              ' The deciduous leaves are borne alternately on long petioles (leaf stems), and young leaves are covered with reddish hairs.',
          quantity: '1 kg',
        ),
        RecommedPlantCard(
          images: "images/5-pineapple.png",
          name: "Pineapple",
          country: "India",
          price: 300,
          description:
              'A pineapple is a sweet tropical fruit with a tough leathery skin and spiky leaves on top',
          quantity: '1 Kg',
        ),
      ]),
    );
  }
}

class RecommedPlantCard extends StatefulWidget {
  const RecommedPlantCard(
      {Key? key,
      required this.images,
      required this.name,
      required this.country,
      required this.price,
      required this.quantity,
      required this.description})
      : super(key: key);

  final String images, name, country;
  final double price;
  final String quantity;
  final String description;

  @override
  State<RecommedPlantCard> createState() => _RecommedPlantCardState();
}

class _RecommedPlantCardState extends State<RecommedPlantCard> {
  String _response = "";
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
                      name: widget.name,
                      price: widget.price,
                      description: widget.description,
                      quantity: widget.quantity,
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(
            top: kdefaultpadding / 2,
            left: kdefaultpadding,
            bottom: kdefaultpadding * 2.5),
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
                  Text("${widget.name}\n".toUpperCase(),
                      style: Theme.of(context).textTheme.button),
                  Row(children: [
                    Badge(
                      badgeContent: Text(
                        _response,
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
                      "₹${widget.price}",
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
