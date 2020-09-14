
import 'package:covid19/helpers/fact_list.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class InformationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fact'),
        backgroundColor: Colors.blueGrey.withOpacity(0.5),
      ),
      body:
           ListView.builder(
                   itemCount: fact.length,
                   itemBuilder: (ctx, index) {
                     return Card(
                         elevation: 5,
                     child: ListTile(
                       leading: CircleAvatar(backgroundColor: Colors.blueGrey,radius: 5,),
                       title: Text('${fact[index].Q}\n',style: kTitleTextstyle.copyWith(fontSize: 18,fontWeight: FontWeight.w500),),
                       subtitle: Text('${fact[index].A}\n', style: kSubTextStyle,),)
                     );
                   }),
    );
  }
}
