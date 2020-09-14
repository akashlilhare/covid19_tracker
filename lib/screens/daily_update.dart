import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../screens/precautionScreen.dart';
import './staticsscreen.dart';
import './symptions.dart';
import '../helpers/httphelper.dart';
import '../screens/know_more.dart';
import '../widgets/info_card.dart';
import '../provider/dataprovider.dart';
import '../widgets/my_header.dart';
import '../constant.dart';
import '../provider/casesChat.dart';
import './informationscreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final controller = ScrollController();
  double offset = 0;


  Map<String, List<CovidData>> _data;
  bool _isLoading;
  List<String> _countryList;
  int _startingDate= 0;

  double _totalConfirmed = 0;
  double _totalDeaths = 0;
  double _totalRecovered = 0;



  List<Cases> _confirmed = new List();
  List<Cases> _deaths = new List();
  List<Cases> _recovered = new List() ;
  List<Cases> _active = new List();

  @override
  void initState() {
    super.initState();
    controller.addListener(onScroll);
    _isLoading = true;


    Services.getData().then((coValue) {
      setState(() {
        _data = coValue;
        _startingDate =_data['India'].length;
        _isLoading = false;
        _countryList = coValue.keys.toList();
        for(int i = 0; i < _data.length; i++){
          _totalConfirmed += _data[_countryList[i]][_startingDate-1].confirmed;
          _totalDeaths += _data[_countryList[i]][_startingDate -1].deaths;
          _totalRecovered += _data[_countryList[i]][_startingDate -1].recovered;
        }

       _confirmed =new List(_startingDate);
_deaths =new List(_startingDate);
 _recovered =new List(_startingDate);
 _active =new List(_startingDate);

double c = 0, r =0, d = 0, a = 0;
       for(int i = 0; i < _startingDate; i++){
         for(int j =0; j < 188; j++)
          {
            c+= _data[_countryList[j]][i].confirmed;
            r+= _data[_countryList[j]][i].recovered;
            d+= _data[_countryList[j]][i].deaths;
            a+= _data[_countryList[j]][i].confirmed -_data[_countryList[j]][i].recovered-_data[_countryList[j]][i].deaths;
          }
           _confirmed[i] = Cases(data: c, date: DateTime.utc(2020,DateTime.january,22).add(Duration(days: i)));
         _deaths[i] = Cases(data: d, date: DateTime.utc(2020,DateTime.january,22).add(Duration(days: i)));
         _recovered[i]= Cases(data: r, date: DateTime.utc(2020,DateTime.january,22).add(Duration(days: i)));
         _active[i] = Cases(data: a, date: DateTime.utc(2020,DateTime.january,22).add(Duration(days: i)));
          c = 0;
          r = 0;
          d = 0;
          a = 0;
       }

      });
    });

  }


  @override
  void dispose() {
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
          children: <Widget>[
            MyHeader(
              image: "assets/icons/Drcorona.svg",
              textTop: "All you need",
              textBottom: "is stay at home.",
              offset: offset,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Case Update\n",
                              style: kTitleTextstyle,
                            ),
                            TextSpan(
                              text: DateFormat.yMMMMEEEEd().format(DateTime.now().toLocal()).toString(),
                              style: TextStyle(
                                color: kTextLightColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CovidInfo()),
                          );
                        },
                        child: Text(
                          "See details",
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

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
                    child: Wrap(
                      runSpacing: 20,
                      spacing: 20,
                      children: <Widget>[

                       InfoCard(
                              title: "Confirmed ",
                              iconColor: Color(0xFFFF8C00),
                              effectedNum: _totalConfirmed,
                             isLoading: _isLoading,
                            ),

                    InfoCard(
                          title: "Total Deaths",
                          iconColor: Color(0xFFFF2D55),
                          effectedNum: _totalDeaths,
                          isLoading: _isLoading,
                        ),
                   InfoCard(
                          title: " Recovered",
                          iconColor: Color(0xFF50E3C2),
                          effectedNum: _totalRecovered,
                         isLoading: _isLoading,
                        ),
                   InfoCard(
                          title: "Active Cases",
                          iconColor: Color(0xFF5856D6),
                          effectedNum: _totalConfirmed - _totalDeaths - _totalRecovered,
                        isLoading: _isLoading,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "All About Covid-19",
                        style: kTitleTextstyle,
                      ),
                      SizedBox(height: 10,)
                    ],
                  ),

                  SizedBox(height: 20),

                  Column(
                    children: [
                      Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          InformationCard(
                            title: 'Precaution',
                            function: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return PreventionScreenn();
                                  },
                                ),
                              );
                            },
                          ),
                          InformationCard(
                            title: 'Statistics',
                            function: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Chart(
                                      confirmed: _confirmed,
                                      activeCase: _active,
                                      deaths: _deaths,
                                      recovered: _recovered,
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          InformationCard(
                            title: 'Symptoms',
                            function: (){ Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return symptomScreen();
                                },
                              ),
                            );},
                          ),
                          InformationCard(
                            title: 'Information',
                            function: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return InformationScreen();
                                  },
                                ),
                              );
                            },
                          ),

                        ],
                      )
                    ],
                  ),


SizedBox(height: 40,)
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class InformationCard extends StatelessWidget {
final String title;
final Function function;
InformationCard({
  @required this.title,
  this.function
});
  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: EdgeInsets.all(5),
        child: RaisedButton(
          child: Column(
            children: [
            //  cardIcon,
              Padding(
                padding: EdgeInsets.all(0),
                child: Padding(padding: EdgeInsets.all(10),
                child:  Text(title, style: kTitleTextstyle.copyWith(color: kPrimaryColor),),
                ),
              )
            ],
          ),
          onPressed: function,
        ),
      );
  }
}


