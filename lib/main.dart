
import './screens/daily_update.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'helpers/httphelper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Services(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          accentColor: Colors.green
        ),
        title: 'Covid Tracker',
        home: HomeScreen(),
      ),
    );
  }
}

