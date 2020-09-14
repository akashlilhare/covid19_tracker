
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constant.dart';


class InfoCard extends StatelessWidget {
  final String date;
  final String title;
  final double effectedNum;
  final Color iconColor;
  final Function press;
  final bool isLoading;
  const InfoCard({
    Key key,
    this.title,
    this.effectedNum,
    this.iconColor,
    this.press,
    this.isLoading,
    this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTap: press,
          child: Container(
            width: constraints.maxWidth / 2 - 10,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: SingleChildScrollView(
                          child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        // wrapped within an expanded widget to allow for small density device
                        Expanded(
                            child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: iconColor.withOpacity(0.12),
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              "assets/icons/running.svg",
                              height: 12,
                              width: 12,
                              color: iconColor,
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                  isLoading==true?CircularProgressIndicator()  :   Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child:
                          RichText(
                            text: TextSpan(
                              style: TextStyle(color: kBodyTextColor),
                              children: [
                                TextSpan(
                                  text: "${effectedNum.toInt()} \n",
                                  style:
                                      Theme.of(context).textTheme.headline6.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                ),
                                TextSpan(
                                  text: "People",
                                  style: TextStyle(
                                    fontSize: 12,
                                    height: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
//                        Expanded(
//                         // child: LineReportChart(),
//                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

