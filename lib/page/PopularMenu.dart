import 'package:flutter/material.dart';
import 'package:flutter_relive_klearningpro/widget/HeaderWidget.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marquee/marquee.dart';

class PopularMenu extends StatelessWidget {
  late double width, height = 55.0;
  double customFontSize = 13;
  String defaultFontFamily = 'Roboto-Light.ttf';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: 100.0,
                height: height,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFF2F3F7)),
                child: RawMaterialButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => AboutUsDetails(

                        )));
                  },
                  shape: CircleBorder(),
                  child: Icon(
                    Icons.info,
                    color: Color(0xFFAB436B),


                  ),
                ),
              ),
              Text(
                "About us.",
                style: TextStyle(
                    color: Color(0xFF969696),
                    fontFamily: 'Roboto-Light.ttf',
                    fontSize: customFontSize),

              )

            ],
          ),
         /* Column(
            children: <Widget>[
              Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFF2F3F7)),
                child: RawMaterialButton(
                  onPressed: () {},
                  shape: CircleBorder(),
                  child: Icon(
                    FontAwesomeIcons.clock,
                    color: Color(0xFFC1A17C),
                  ),
                ),
              ),
              Text(
                "Flash Sell",
                style: TextStyle(
                    color: Color(0xFF969696),
                    fontFamily: defaultFontFamily,
                    fontSize: customFontSize),
              )
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFF2F3F7)),
                child: RawMaterialButton(
                  onPressed: () {},
                  shape: CircleBorder(),
                  child: Icon(
                    FontAwesomeIcons.truck,
                    color: Color(0xFF5EB699),
                  ),
                ),
              ),
              Text(
                "Evaly Store",
                style: TextStyle(
                    color: Color(0xFF969696),
                    fontFamily: defaultFontFamily,
                    fontSize: customFontSize),
              )
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFF2F3F7)),
                child: RawMaterialButton(
                  onPressed: () {},
                  shape: CircleBorder(),
                  child: Icon(
                    FontAwesomeIcons.gift,
                    color: Color(0xFF4D9DA7),
                  ),
                ),
              ),
              Text(
                "Voucher",
                style: TextStyle(
                    color: Color(0xFF969696),
                    fontFamily: defaultFontFamily,
                    fontSize: customFontSize),
              )
            ],
          )*/
        ],
      ),
    );
  }
}
//New route(Detail Page)
class AboutUsDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, strTitle: 'About us.',),
      body: Container(

          child: Marquee(
            text: 'This is k learning app.I hope you are happy to be with us.',
            style: TextStyle(fontWeight: FontWeight.bold),
            scrollAxis: Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            blankSpace: 20.0,
            velocity: 100.0,
            pauseAfterRound: Duration(seconds: 1),
            startPadding: 10.0,
            accelerationDuration: Duration(seconds: 1),
            accelerationCurve: Curves.linear,
            decelerationDuration: Duration(milliseconds: 500),
            // decelerationCurve: Curves.easeOut,
          ),

      ),

    );
  }
}
