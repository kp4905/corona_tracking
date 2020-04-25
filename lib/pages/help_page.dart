import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class help extends StatefulWidget {
  @override
  _helpState createState() => _helpState();
}
class _helpState extends State<help> {
  void launchurl(String url)async{
    if(await canLaunch(url)){
      await launch(url);
    }
    else{
      throw 'could not open url';
    }
  }
  void launchcaller(int number)async{
    var url="tel:${number.toString()}";
    if(await canLaunch(url)){
      await launch(url);
    }
    else{
      throw 'could not place call';
    }
  }
  void launchemail(String emailid)async {
    var url = "mailto:$emailid?subject= Help";
    if (await canLaunch(url)) {
      await launch(url);
    }
    else {
      throw 'could not send E-mail';
    }
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Colors.blueGrey[700] ,
        appBar: AppBar(
          centerTitle: true,
          title: Text('HelpLine'),
          backgroundColor: Colors.redAccent,
        ),
         body: SingleChildScrollView(
           child: Column(
             children: <Widget>[
               buildbutt(context,'nCovid19 Toll Free Helpline' , 1075,'ncov2019@gov.in','1075 | ncov2019@gov.in ',Colors.white),
               buildbutt(context,'Telangana State Corona Helpline' , 104,'stateportal@telangana.gov.in','104 | stateportal@telangana.gov.in',Colors.white),
               buildbutt(context,'Ministry of Health Affairs India',911123978046,'ncov2019@gov.in','+91-11-23978046  |  ncov2019@gov.in',Colors.white),
               buildbutt2(context, 'World Health Organization', 'https://www.who.int/emergencies/diseases/novel-coronavirus-2019'),
               buildbutt2(context,'Ministry of Health and Family Welfare\n Government of India','https://www.mohfw.gov.in/')
             ],
           ),
         ),
    );
  }
  Widget buildbutt(BuildContext context,name,int contact,mail,cont,ccolor) {
    return Card(
      color:ccolor,
      margin: EdgeInsets.fromLTRB(16.0,16.0,16.0,0.0),
      child:
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(
              height:12,
            ),
            Text(cont,
              style: TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height:2.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FlatButton.icon(
                  onPressed:(){launchcaller(contact);},
                  icon: Icon(Icons.call),
                  label: Text('Call'),
                ),
                FlatButton.icon(
                  onPressed:(){launchemail(mail);},
                  icon: Icon(Icons.mail),
                  label: Text('Email'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

Widget buildbutt2(BuildContext context,name,url) {
  return Card(
    color:Colors.white,
    margin: EdgeInsets.fromLTRB(16.0,16.0,16.0,0.0),
    child:
    Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(
            height:12,
          ),
          Text(url,
            style: TextStyle(
              fontSize: 12,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(height:2.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton.icon(
                onPressed:(){launchurl(url);},
                icon: Icon(Icons.search),
                label: Text('Browse'),
              ),

            ],
          )
        ],
      ),
    ),
  );
}
}
