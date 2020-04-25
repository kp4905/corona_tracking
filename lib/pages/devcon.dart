import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:social_media_buttons/social_media_buttons.dart';
import 'package:CoronaVirusTracker/service/screenconfig.dart';

void main() => runApp(MaterialApp(
    home: KPcard()
));
class KPcard extends StatefulWidget {
  @override
  _KPcardState createState() => _KPcardState();
}

class _KPcardState extends State<KPcard> {
  int enrollmentid=0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: Text('---PROFILE---'),
        elevation:0.0 ,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0,40.0, 30.0, 0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: CircleAvatar(
                    backgroundImage: AssetImage('assets/mylog.jpg'),
                    radius: 45.0),
              ),
              Divider(
                height: 62,
                color: Colors.blueGrey,
              ),
              Text('NAME',
                style: TextStyle(
                  letterSpacing:4.0,
                  color: Colors.grey,
                ),),
              SizedBox(height:8),
              Text('K PRANEETH KUMAR',
                style: TextStyle(
                  letterSpacing:4.0,
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                  fontSize:SizeConfig.blockSizeHorizontal *6,
                ),),
              SizedBox(height:30.0,),
              Row(
                  children: <Widget>[
                    Icon(
                      Icons.mail_outline,
                      color: Colors.grey[400],
                      size: SizeConfig.blockSizeHorizontal *5,
                    ),
                    SizedBox(width: 8.0),
                    SelectableText('praneethkumar4905@gmail.com',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize:SizeConfig.blockSizeHorizontal *4,
                      ),),
                  ] ),
              SizedBox(height:SizeConfig.blockSizeVertical*2,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SocialMediaButton.whatsapp(url:"https://wa.me/919989235096",
                        color: Colors.grey[400],
                        size:SizeConfig.blockSizeHorizontal *8),
                      SocialMediaButton.twitter(url:"https://twitter.com/__sanatan",
                      color: Colors.grey[400],

                      size: SizeConfig.blockSizeHorizontal *8),
                    SizedBox(width: 8.0),
                    SocialMediaButton.instagram(url:"https://www.instagram.com/praneethkumer/",
                        color: Colors.grey[400],
                        size: SizeConfig.blockSizeHorizontal *8),
                    SizedBox(width: 8.0),
                    SocialMediaButton.facebook(url:"https://www.facebook.com/kp4905",
                        color: Colors.grey[400],
                        size:SizeConfig.blockSizeHorizontal *8),
                    SocialMediaButton.linkedin(url:"https://www.linkedin.com/in/praneeth-kumar-kontham-111945141",
                        color: Colors.grey[400],
                        size:SizeConfig.blockSizeHorizontal *8),
                    SocialMediaButton.youtube(url:"https://www.youtube.com/channel/UCad5LthQ4llP7nQ3JbDMuaA",
                        color: Colors.grey[400],
                        size:SizeConfig.blockSizeHorizontal *8),

                  ] ),
            Text('                             Tap to Connect',
            style: TextStyle(
              fontSize:SizeConfig.blockSizeHorizontal *4,
              color: Colors.grey,
            ),textAlign: TextAlign.center,)
            ]),
      ),
    );
  }
}

