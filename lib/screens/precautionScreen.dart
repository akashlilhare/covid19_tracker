
import 'package:covid19/widgets/custum_header.dart';
import 'package:covid19/widgets/preventioncard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class PreventionScreenn extends StatefulWidget {
  @override
  _PreventionScreennState createState() => _PreventionScreennState();
}


class _PreventionScreennState extends State<PreventionScreenn> {
  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CuMyHeader(
              image: "assets/images/header_prec.jpg",
              textTop: "Cover Your Face",
              textBottom: "While snising",
              offset: offset,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Text("Prevention", style: kTitleTextstyle),
                  SizedBox(height: 20),
                  PreventCard(
                    text:
                    "Everyone should wear a mask in public settings and when around people who don’t live in your household, especially when other social distancing measures are difficult to maintain.",
                    image: "assets/images/wear_mask.jpg",
                    title: "Wear face mask",
                  ),
                  PreventCard(
                    text:
                    "Wash your hands often with soap and water for at least 20 seconds especially after you have been in a public place, or after blowing your nose, coughing, or sneezing.",
                    image: "assets/images/wash_hand.jpg",
                    title: "Wash your hands",
                  ),
                  PreventCard(
                    text:
                    " Avoid close contact with people who are sick."
                   " If possible, maintain 6 feet between the person who is sick and other household members.",
                    image: "assets/images/social-destencing.jpg",
                    title: "Avoid close contact",
                  ),
                  PreventCard(
                    text:
                    "Since the start of the coronavirus outbreak some places have fully embraced wearing facemasks",
                    image: "assets/images/dont_toch_face.jpg",
                    title: "Don’t touch your eyes, nose or mouth.",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}




