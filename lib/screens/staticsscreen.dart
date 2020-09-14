import 'package:charts_flutter/flutter.dart' as charts;
import '../provider/casesChat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Chart extends StatefulWidget {
  final List<Cases> confirmed;
  final List<Cases> activeCase;
  final List<Cases> recovered;
  final List<Cases> deaths;



  Chart({
    this.confirmed,
    this.activeCase,
    this.deaths,
    this.recovered,
  });

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<charts.Series<Cases, DateTime>> _seriesData = new List();

  @override
  initState() {
    print(_seriesData.length);
    print(widget.activeCase.length);
    _seriesData.add(charts.Series(
      colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
      data: widget.confirmed,
      domainFn: (Cases cases, _) => cases.date,
      measureFn: (Cases cases, _) => cases.data,
      id: 'confirmed',
    ));

    _seriesData.add(charts.Series(
      colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      data: widget.recovered,
      id: 'recovered',
      domainFn: (Cases cases, _) => cases.date,
      measureFn: (Cases cases, _) => cases.data,
    ));

    _seriesData.add(charts.Series(
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      id: 'deaths',
      displayName: 'Daily Cases',
      domainFn: (Cases cases, _) => cases.date,
      measureFn: (Cases cases, _) => cases.data,
      data: widget.deaths,
    ));

    _seriesData.add(charts.Series(
      colorFn: (_, __) => charts.MaterialPalette.deepOrange.shadeDefault,
      id: 'air',
      displayName: 'Daily Cases',
      domainFn: (Cases cases, _) => cases.date,
      measureFn: (Cases cases, _) => cases.data,
      data: widget.activeCase,
    ));
    print(_seriesData.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:  Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child:   Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(color: Colors.blue,
                        height: 20,
                        width: 20,
                      ),
                      Text('Active Cases'),

                      Container(color: Colors.green,
                        height: 20,
                        width: 20,
                      ),
                      Text('Recovered'),

                      Container(color: Colors.red,
                        height: 20,
                        width: 20,
                      ),
                      Text('Deaths'),

                      Container(color: Colors.deepOrange,
                        height: 20,
                        width: 20,
                      ),
                      Text('Confirmed'),
                    ],
                  ),
                ),

//SingleChildScrollView(
//  child:
  Expanded(

    child: charts.TimeSeriesChart(
      _seriesData,
      animate: true,
      animationDuration: Duration(seconds: 2),
     flipVerticalAxis:false,
      domainAxis: charts.DateTimeAxisSpec(
        tickFormatterSpec: charts.AutoDateTimeTickFormatterSpec(
          day: charts.TimeFormatterSpec(
            format: 'mm',
            transitionFormat: 'mm',
          ),
        ),
      ),

      defaultRenderer:
      new charts.LineRendererConfig(includeArea: true, stacked: true,areaOpacity: 0.3,includePoints: true,strokeWidthPx: 5,
        //  dashPattern: [1,2],
          layoutPaintOrder:charts.LayoutViewPaintOrder.linePointHighlighter,roundEndCaps: true, ),
      behaviors: [
        new charts.ChartTitle('Month',innerPadding: 1,layoutMinSize: 111,maxWidthStrategy:charts.MaxWidthStrategy.ellipsize ,
            behaviorPosition: charts.BehaviorPosition.bottom,
            titleOutsideJustification:
            charts.OutsideJustification.middleDrawArea),
        new charts.ChartTitle(
          'Cases',
          behaviorPosition: charts.BehaviorPosition.start,
          titleOutsideJustification:
          charts.OutsideJustification.middle,
        ),

      ],
    ),
 // ),

)

              ],
            ))
    );

  }
}
