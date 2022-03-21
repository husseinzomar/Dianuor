import 'package:flutter/material.dart';
import 'package:dianour2/data.dart';

class Facebook extends StatefulWidget {
  static const routName = 'facebook-page';
  //final DataInfo dataInfo;
  const Facebook({
    Key? key,
  }) : super(key: key);

  @override
  _FacebookState createState() => _FacebookState();
}

class PlanetInfo {}

class _FacebookState extends State<Facebook> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Padding(
          padding: EdgeInsets.only(left: 10, top: 7, bottom: 5),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 22, left: 28),
            )
          ],
        ),
      ),
    ));
  }
}
