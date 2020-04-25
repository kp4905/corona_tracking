import 'package:flutter/material.dart';
import 'package:CoronaVirusTracker/service/screenconfig.dart';
class about extends StatefulWidget {
  @override
  _aboutState createState() => _aboutState();
}
class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.safeBlockVertical * 10, //10 for example
      width: SizeConfig.safeBlockHorizontal * 10,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title:Text('About nCovid-19',
          style: TextStyle(
            fontSize: 20,
          )
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('images/coronavirus.png',height: 100,width: 100 ,),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Coronavirus disease (COVID-19) is an infectious disease caused by a newly discovered coronavirus.'
                  'Most people infected with the COVID-19 virus will experience mild to moderate respiratory illness and recover without requiring special treatment.  Older people, and those with underlying medical problems like cardiovascular disease, diabetes, chronic respiratory disease, and cancer are more likely to develop serious illness.'
                  '\n\nThe best way to prevent and slow down transmission is be well informed about the COVID-19 virus, the disease it causes and how it spreads. Protect yourself and others from infection by washing your hands or using an alcohol based rub frequently and not touching your face.'
                  'The COVID-19 virus spreads primarily through droplets of saliva or discharge from the nose when an infected person coughs or sneezes, so it’s important that you also practice respiratory etiquette (for example, by coughing into a flexed elbow).'
                  'At this time, there are no specific vaccines or treatments for COVID-19. However, there are many ongoing clinical trials evaluating potential treatments. WHO will continue to provide updated information as soon as clinical findings become available.',
                  style: TextStyle(fontSize: 20,
                    color: Colors.blueGrey,

                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
