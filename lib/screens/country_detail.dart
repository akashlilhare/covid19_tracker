
import '../widgets/info_detailed_card.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class CountryDetailScreen extends StatelessWidget {
  final double totalConfirmed;
  final double totalDeaths;
  final double totalRecovered;
  final double totalActiveCases;
  final String countryName;


  CountryDetailScreen({
    this.totalConfirmed,
    this.totalDeaths,
    this.totalRecovered,
    this.totalActiveCases,
    this.countryName,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(countryName),),
      body:Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
            width: double.infinity,
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.03),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                Container(
                  child: Text(
                    countryName,
                    style: kHeadingTextStyle,
                  ),
                ),
                SizedBox(height: 20,),
                Wrap(
                  runSpacing: 20,
                  spacing: 20,
                  children: <Widget>[
                    InfoDetailedCard(
                      title: "Confirmed ",
                      iconColor: Color(0xFFFF8C00),
                      effectedNum: totalConfirmed,
                      //  isLoading: _isLoading,
                    ),
                    InfoDetailedCard(
                      title: "Total Deaths",
                      iconColor: Color(0xFFFF2D55),
                      effectedNum: totalDeaths,
                      //  isLoading: _isLoading,
                    ),
                    InfoDetailedCard(
                      title: " Recovered",
                      iconColor: Color(0xFF50E3C2),
                      effectedNum: totalRecovered,
                      // isLoading: _isLoading,
                    ),
                    InfoDetailedCard(
                      title: "Active Cases",
                      iconColor: Color(0xFF5856D6),
                      effectedNum: totalActiveCases,

                    ),
                  ],
                ),
              ],
            ),
          ),
                  ],
      )
    );
  }
}
