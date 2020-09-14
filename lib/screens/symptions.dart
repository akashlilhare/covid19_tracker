import 'package:covid19/widgets/custum_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

// ignore: camel_case_types
class symptomScreen extends StatefulWidget {
  @override
  _symptomScreenState createState() => _symptomScreenState();
}

// ignore: camel_case_types
class _symptomScreenState extends State<symptomScreen> {

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

            SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '  Common Symptoms',
                  style: kHeadingTextStyle,
                ),
                Text(
                  '''
                 
    Fever:  99%
    Fatigue: 70%
    A dry cough:  59%
    Loss of appetite:  40%
    Body aches:  35%
    Shortness of breath:  31%
    Mucus or phlegm:  27%
''',
                  style: kSubTextStyle.copyWith(fontWeight: FontWeight.w900,fontSize: 20),
                ),

                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Symptoms usually begin 2 to 14 days after you come into contact with the virus',
                    style:kHeadingTextStyle.copyWith(fontSize: 22) ,
                  ),
                ),

                Text(
                  '''
                  
    Sore throat
    Headache
    Chills, sometimes with shaking
    Loss of smell or taste
    Congestion or runny nose
    Nausea or vomiting 
    Diarrhea
  
''',style: kSubTextStyle.copyWith(fontWeight: FontWeight.w900,fontSize: 20)
                ),
                Padding(padding: EdgeInsets.all(10),
                child: Text('Emergency Symptoms',style:kHeadingTextStyle ,),
                ),

                Text('''  
                
   Trouble breathing
   Constant pain or pressure in your chest
   Bluish lips or face
   Sudden confusion
   
''',style: kSubTextStyle.copyWith(fontWeight: FontWeight.w900,fontSize: 20))
              ],
            ))
          ],
        ),
      ),
    );
  }
}
