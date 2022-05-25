import 'package:berry/Common/Constant.dart';
import 'package:flutter/material.dart';

class TitleWithMoreButton extends StatelessWidget {
  const TitleWithMoreButton({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);
  final String title;
  final Function() press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kdefaultpadding),
      child: Row(children: [
        TitleWithCustomUnderline(
          title: title,
        ),
        Spacer(),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: kprimaryColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
            onPressed: press,
            child: const Text(
              'More',
              style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
            ))
      ]),
    );
  }
}

class TitleWithCustomUnderline extends StatelessWidget {
  const TitleWithCustomUnderline({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: kdefaultpadding / 4),
            child: Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // Positioned(
          //     bottom: 0,
          //     left: 0,
          //     right: 0,
          //     child: Container(
          //         margin: const EdgeInsets.only(right: kdefaultpadding / 4),
          //         height: 7,
          //         decoration: BoxDecoration(
          //           color: Colors.transparent,
          //           boxShadow: [
          //             BoxShadow(
          //               offset: Offset(0, -10),
          //               blurRadius: 35,
          //               color: kprimaryColor.withOpacity(0.38),
          //             )
          //           ],
          //         )))
        ],
      ),
    );
  }
}
