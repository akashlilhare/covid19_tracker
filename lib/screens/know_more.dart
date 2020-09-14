import '../constant.dart';
import '../provider/countrydata.dart';
import './country_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../helpers/httphelper.dart';
import '../provider/dataprovider.dart';
import '../helpers/country_list.dart';
import 'country_detail.dart';


class CovidInfo extends StatefulWidget {
  static const route = '/know-more-screen';

  @override
  _CovidInfoState createState() => _CovidInfoState();
}

class _CovidInfoState extends State<CovidInfo> {
  TextEditingController editingController = TextEditingController();
  var items = List<String>();
  var duplicateItems = new List<String>.generate(
      countryName.length, (index) => countryName[index].countryName);

  Map<String, List<CovidData>> _data;
  bool _isLoading;
  List<String> _countryList;
  int _startingDate;



  List<CountryData> countryData;

  List<CountryData> _countryData;

  @override
  void initState() {
    super.initState();
    items.addAll(duplicateItems);

    _isLoading = true;

    Services.getData().then((coValue) {
      setState(() {
        _data = coValue;
        _isLoading = false;
        _countryList = coValue.keys.toList();
        _startingDate = _data['India'].length - 1;
        _countryData = new List(_startingDate);

        double C = 0, D = 0, R = 0, A = 0;
        for (int j = 0; j < _data.length; j++) {
          C += _data[_countryList[j]][_startingDate].confirmed;
          D += _data[_countryList[j]][_startingDate].deaths;
          R += _data[_countryList[j]][_startingDate].recovered;
          A = C - D - R;
          _countryData[j] =
              CountryData(activeCases: A, deaths: D, confirm: C, recovered: R);
          C = 0;
          D = 0;
          R = 0;
          A = 0;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        //  minimum: EdgeInsets.all(1),
        child: Scaffold(
            body: Column(
      children: [
        Expanded(
          child: _isLoading == true
              ? Center(
                  child: CircularProgressIndicator(
                      backgroundColor: Colors.amber),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: 188,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Card(
                        color: kBackgroundColor,
                        child: ListTile(
                          title: Text(
                            countryName[index].countryName,
                            style: kTitleTextstyle,
                          ),
                          leading: CircleAvatar(
                            child: Image.network(countryName[index].flag),
                          ),
                          trailing: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CountryDetailScreen(
                                          countryName:
                                              countryName[index].countryName,
                                          totalRecovered:
                                              _countryData[index].recovered,
                                          totalDeaths:
                                              _countryData[index].deaths,
                                          totalConfirmed:
                                              _countryData[index].confirm,
                                          totalActiveCases:
                                              _countryData[index].activeCases,
                                        )),
                              );
                            },
                            child: Text('Know More'),
                          ),
                          subtitle: Text(
                            "Active Cases : ${_countryData[index].activeCases.toInt().toString()}",
                            style: kSubTextStyle.copyWith(
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        elevation: 3.0,
                      ),
                    );
                  }),
        )
      ],
    )));
  }
}
