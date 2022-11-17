import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';

class SplashTowe extends StatefulWidget {
  const SplashTowe({Key key}) : super(key: key);

  @override
  _SplasheOneState createState() => _SplasheOneState();
}

class _SplasheOneState extends State<SplashTowe> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Stack(fit: StackFit.expand, children: [
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset(
          "assets/images/image_w.png",
          fit: BoxFit.cover,
        ),
      ),
      Positioned(
        left: 25,
        top: 25,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Stay Home',
                style: titilliumBold.copyWith(fontSize: _height * 0.050),
                textAlign: TextAlign.left),
            Text("and shopping",
                textAlign: TextAlign.left,
                style: titilliumRegular.copyWith(
                  fontSize: _height * 0.030,
                )),
            Text("Online",
                textAlign: TextAlign.left,
                style: titilliumRegular.copyWith(
                  fontSize: _height * 0.030,
                )),
          ],
        ),
      )
    ]));
  }
}
