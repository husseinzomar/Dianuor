import 'package:flutter/material.dart';
import 'package:dianour2/data.dart';

class HR_team extends StatelessWidget {
  final DataInfo dataInfo;
  static const routName = 'hr-team';
  const HR_team({Key? key, required this.dataInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(
                          height: 300,
                        ),
                        Text(
                          dataInfo.name,
                          style: const TextStyle(
                              fontSize: 50,
                              color: Colors.red,
                              fontWeight: FontWeight.w900),
                          textAlign: TextAlign.left,
                        ),
                        const Divider(
                          color: Colors.black38,
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 32.0),
                  ),
                  Container(
                    height: 250,
                    padding: const EdgeInsets.only(
                      left: 20.0,
                    ),
                    child: ListView.builder(
                      itemCount: dataInfo.iconImage.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Image.network(
                              dataInfo.iconImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              //rright: 64,
              child: Hero(
                tag: dataInfo.position,
                child: Image.asset(dataInfo.iconImage),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
