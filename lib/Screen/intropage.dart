import 'package:dianour2/Screen/homepage2.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  static const rotName = 'intro-page';
  
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      onPrimary: Colors.black87,
      primary: Colors.blue[300],
      minimumSize: const Size(55, 36),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20))
      )
    );
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black, 
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,

        ),
        body: SingleChildScrollView(
          child: Container(
            width: size.width,
            height: size.height,
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: size.height * 0.2,
              top: size.height * 0.05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Hello, \nWelcome To Dia Nour",
                  style: TextStyle(
                      fontSize: size.width * 0.1, color: Colors.white),
                ),
                const SizedBox(
                  height: 50,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 300,
                            height: 80,
                            margin: const EdgeInsets.all(50),
                            child: ElevatedButton(
                              style: raisedButtonStyle,
                              onPressed: () {
                                Navigator.of(context).pushNamed(HomePage2.routName);
                              }, 
                              child: const Text(
                                'Enter Now',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
