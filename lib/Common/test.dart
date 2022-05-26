import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  String _response = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page 1")),
      body: Column(
        children: [
          Text(_response),
          Center(
            child: RaisedButton(
              child: Text("Go to Page 2"),
              onPressed: () {
                Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Page2()))
                    .then((value) {
                  setState(() {
                    _response = value; // you receive here
                  });
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page 2")),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (c, i) {
          return ListTile(
            title: Text("Item ${i}"),
            onTap: () {
              Navigator.pop(context, "Item ${i}"); // what you pass here
            },
          );
        },
      ),
    );
  }
}
