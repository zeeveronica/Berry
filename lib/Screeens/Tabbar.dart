import 'package:berry/Common/Constant.dart';
import 'package:flutter/material.dart';

class CategoriesTabbar extends StatefulWidget {
  const CategoriesTabbar({Key? key}) : super(key: key);

  @override
  State<CategoriesTabbar> createState() => _CategoriesTabbarState();
}

class _CategoriesTabbarState extends State<CategoriesTabbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimaryColor.withOpacity(0.11),
        shadowColor: kprimaryColor,
        elevation: 0,
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
