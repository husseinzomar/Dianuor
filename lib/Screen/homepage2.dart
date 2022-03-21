import 'dart:io';
import 'dart:math';
import 'package:dianour2/Screen/facebook.dart';
import 'package:dianour2/Screen/instagram.dart';
import 'package:dianour2/Screen/hr_team.dart';
import 'package:dianour2/data.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/material.dart';

var card = 12.0 / 16.0;

var widget = card * 1.2;

List<String> images = [
  "asste/dia.png",
  "asste/facebook.png",
  "asste/ig-icon.png",
  "asste/whatsapp.png"
];

List<String> title = ['Dia Nour', 'Facebook', 'Instagram', 'WhatsApp'];

class HomePage2 extends StatefulWidget {
  static const routName = 'home-page1';
  const HomePage2({Key? key}) : super(key: key);

  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  var currentPage = images.length - 1.0;
  @override
  Widget build(BuildContext context) {
    PageController controllers = PageController(initialPage: images.length - 1);
    controllers.addListener(() {
      setState(() {
        currentPage = controllers.page!;
      });
    });
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xFF2d3447),
          elevation: 0,
          title: const Text(
            'Dia Nour Egypt',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: const Color(0xFF2d3447),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Course',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 30.0,
                          letterSpacing: 1.0),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Container(
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(20.0)
                      ),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    height: 500,
                    padding: const EdgeInsets.only(
                      left: 32,
                    ),
                    child: Swiper(
                      itemCount: dataInfo.length,
                      itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                      layout: SwiperLayout.STACK,
                      pagination: const SwiperPagination(
                          builder: DotSwiperPaginationBuilder(
                        activeSize: 20,
                        space: 8,
                      )),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                    pageBuilder: (context, a, b) => Instagram(
                                          dataInfo: dataInfo[index],
                                        )));
                          },
                          child: Stack(children: [
                            Column(children: [
                              const SizedBox(height: 100),
                              Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  elevation: 8,
                                  color: Colors.white,
                                  child: Padding(
                                      padding: const EdgeInsets.all(32.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 100,
                                          ),
                                          Text(
                                            dataInfo[index].name,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 26,
                                              color: Colors.black,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          const SizedBox(
                                            height: 32,
                                          ),
                                          Row(
                                            children: const [
                                              Text(
                                                'Know More',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black38),
                                              ),
                                              Icon(
                                                Icons.arrow_forward,
                                                color: Colors.black38,
                                              )
                                            ],
                                          )
                                        ],
                                      )))
                            ])
                          ]),
                        );
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Social Media',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _facebookURL("Hussein.Abdullah00");
                        },
                        child: Ites(
                            title: 'Facebook', imageUrl: 'asste/facebook.png'),
                      ),
                      InkWell(
                        onTap: () {
                          launchWhatsApp(phone: 01027428684, message: 'hi');
                        },
                        child: Ites(
                            title: 'WhatsApp', imageUrl: 'asste/whatsapp.png'),
                      ),
                      InkWell(
                        onTap: () {
                          _instagramURL("hussein_zomar");
                        },
                        child: Ites(
                            title: 'Instagram',
                            imageUrl: 'asste/instagram.png'),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Ites extends StatelessWidget {
  String title;
  String imageUrl;
  Ites({Key? key, required this.title, required this.imageUrl})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 250,
          width: 200,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                left: 10,
                top: 170,
                bottom: 20,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}

class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;

  CardScrollWidget(this.currentPage);
  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: widget,
      child: LayoutBuilder(
        builder: (context, contraints) {
          var width = contraints.maxWidth;
          var height = contraints.maxHeight;

          var safeWidth = width - 2 * padding;
          var safeHeight = height - 2 * padding;

          var heightOfPrimaryCard = safeHeight;
          var widthOfPrimaryCard = heightOfPrimaryCard * card;

          var primaryCardLeft = safeWidth - widthOfPrimaryCard;
          var horizontalInset = primaryCardLeft / 2;

          List<Widget> cardList = [];

          for (var i = 0; i < images.length; i++) {
            var delta = i - currentPage;
            bool isOnRight = delta > 0;

            var start = padding +
                max(
                    primaryCardLeft -
                        horizontalInset * -delta * (isOnRight ? 15 : 1),
                    0.0);

            var cardItem = Positioned.directional(
              top: padding + verticalInset * max(-delta, 0.0),
              bottom: padding + verticalInset * max(-delta, 0.0),
              start: start,
              textDirection: TextDirection.rtl,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(3.0, 6.0),
                            blurRadius: 10.0)
                      ]),
                  child: AspectRatio(
                    aspectRatio: card,
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Image.asset(images[i], fit: BoxFit.cover),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 8.0),
                                child: Text(
                                  title[i],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 12.0, bottom: 12.0),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 22.0, vertical: 6.0),
                                  decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: InkWell(
                                    child: Text(
                                      'Read Later',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed(Facebook.routName);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
            cardList.add(cardItem);
          }
          return Stack(
            children: cardList,
          );
        },
      ),
    );
  }
}

_facebookURL(String $profileName) async {
  var url = 'https://www.facebook.com/' + $profileName;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_instagramURL(String $profileName) async {
  var url = 'https://www.instagram.com/' + $profileName;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_whatsappURL(int $num) async {
  var x;
  int url = 01027428684;
  if (await canLaunch(x.toString(url))) {
    await launch(x.toString(url));
  } else {
    throw 'Could not launch $url';
  }
}

void launchWhatsApp({
  required int phone,
  required String message,
}) async {
  String url() {
    if (Platform.isAndroid) {
      // add the [https]
      return "https://wa.me/$phone/?text=${Uri.parse(message)}"; // new line
    } else {
      // add the [https]
      return "https://api.whatsapp.com/send?phone=$phone=${Uri.parse(message)}"; // new line
    }
  }
}
