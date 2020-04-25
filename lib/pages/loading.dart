import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:CoronaVirusTracker/service/indian_cases.dart';
import 'package:CoronaVirusTracker/service/world_cases.dart';
import 'package:CoronaVirusTracker/service/screenconfig.dart';
import 'package:ant_icons/ant_icons.dart';
import 'package:CoronaVirusTracker/pages/updates.dart';
import 'package:badges/badges.dart';

class loading extends StatefulWidget {
  @override
  _loadingState createState() => _loadingState();
}
class _loadingState extends State<loading> {
  bool counter= true;

  dynamic Confirmed='loading';
  dynamic lastupDate='--';
  dynamic Recovered='loading';
  dynamic Deaths='loading';
  dynamic Iconfirm='loading';
  dynamic Idate='loading';
  dynamic Ideaths='loading';
  dynamic Irecovered='loading';

  void setupworldcases()
  async{
       worldcases instance=worldcases();
       await instance.getcases();
       print(instance.Deaths);
       print(instance.Confirmed);
       setState(() {
         Confirmed=instance.Confirmed;
         Recovered=instance.Recovered;
         Deaths=instance.Deaths;
       });
  }
  _refreshAction() {
    setState(() {
       Confirmed='loading';
       lastupDate='--';
       Recovered='loading';
       Deaths='loading';
       Iconfirm='loading';
       Idate='loading';
       Ideaths='loading';
       Irecovered='loading';
      setupindiancases();
      setupworldcases();
    });
  }
  void setupindiancases()async{
    indiancases instance= indiancases();
    await instance.getData();
    print(instance.Deaths);
    setState(() {
      Iconfirm = instance.Confirmed;
      Ideaths = instance.Deaths;
      Irecovered = instance.Recovered;
      Idate=instance.LastupDate;
      lastupDate=instance.date;
    });
  }
  double opacity = 1.0;
  @override
  void initState() {
    super.initState();
    setupworldcases();
    setupindiancases();
    changeOpacity();
  }
  changeOpacity() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        opacity = opacity == 0.0 ? 1.0 : 0.0;
        changeOpacity();
      });
    });
  }
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        //height: SizeConfig.blockSizeVertical * 100, //10 for example
        //width: SizeConfig.blockSizeHorizontal * 100,
        backgroundColor: Colors.blueGrey[700],
        bottomNavigationBar: BottomAppBar(
          child: Text("Last Updated $Idate",
            style:TextStyle(
              fontSize:12,
              fontWeight: FontWeight.bold,) ,
            textAlign: TextAlign.center,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    height: SizeConfig.blockSizeVertical * 13, //10 for example
                    width: SizeConfig.blockSizeHorizontal * 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Badge(
                                    position: BadgePosition.topRight(top:10,right:10),
                                    badgeContent: null,
                                    badgeColor: Colors.lightBlueAccent,
                                    showBadge: counter,

                                    child: IconButton(
                                      onPressed:(){Navigator.pushNamed(context,'/Updates');
                                      setState(() {
                                      counter = false;
                                          });
                                       },
                                      icon: Icon (Icons.notifications),
                                      iconSize: SizeConfig.blockSizeHorizontal*10,
                                      tooltip:'notifications',
                                      color: Colors.white70,
                                    ),
                                  ),
                                  Text('Updates',style:
                                  TextStyle(
                                      fontSize: SizeConfig.blockSizeHorizontal*3,
                                    fontWeight: FontWeight.bold
                                  ),) ],
                              )
                            ),

                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                //SizedBox(height: SizeConfig.safeBlockVertical* 7, //10 for example
                                 // width: SizeConfig.safeBlockHorizontal* 10,),
                                Text('COVID-19 Tracker',
                                    style: TextStyle(
                                      fontSize: SizeConfig.safeBlockHorizontal *10,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'BebasN',
                                      color: Colors.white,
                                    )),
                                //SizedBox(height: SizeConfig.safeBlockVertical * 7, //10 for example
                                  //width: SizeConfig.safeBlockHorizontal * 3,),
                              ],
                            ),
                            Text(
                              "$lastupDate",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConfig.safeBlockHorizontal * 6,
                              ),
                            ),
                            Divider(
                              height:SizeConfig.safeBlockVertical * 1,
                                thickness: 1,
                                color: Colors.lightBlueAccent
                            ),],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              color: Colors.redAccent,
                              child: Column(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.refresh),
                                    onPressed:_refreshAction ,
                                    tooltip: 'Refresh',
                                    iconSize: SizeConfig.blockSizeHorizontal * 10,
                                    color: Colors.white70,
                                  ),
                                  Text('Refresh',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: SizeConfig.blockSizeHorizontal * 3,
                                  ),),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.lightBlueAccent,
                          width: 1
                        )
                      ),
                      color: Colors.redAccent
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(height:SizeConfig.safeBlockVertical * 3),
                      Text('WORLD',
                        style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 10,
                            fontWeight: FontWeight.bold,
                            fontFamily:'BebasN',
                        color: Colors.white)),
                      //SizedBox(height:SizeConfig.safeBlockVertical * 3,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          button("Total\n Confirmed","$Confirmed",Colors.amberAccent,Icons.hotel,Radius.circular(0),Radius.circular(10),Radius.circular(10),Radius.circular(0)),
                          button("Total\n Recovered","$Recovered",Colors.amberAccent[100],Icons.home,Radius.circular(0),Radius.circular(0),Radius.circular(0),Radius.circular(0)),
                          button("Total\n Deaths","$Deaths",Colors.amberAccent,Icons.all_inclusive,Radius.circular(10),Radius.circular(0),Radius.circular(0),Radius.circular(10))
                        ],
                      ),
                      SizedBox(height:SizeConfig.safeBlockVertical * 3),
                      Text('INDIA',
                      style: TextStyle(
                        fontSize:SizeConfig.safeBlockHorizontal * 10,
                        fontWeight: FontWeight.bold,
                        fontFamily:'BebasN',
                        color: Colors.white
                      ),),

                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          button("Total\n Confirmed","$Iconfirm",Colors.amberAccent,Icons.hotel,Radius.circular(0),Radius.circular(10),Radius.circular(10),Radius.circular(0)),
                          button("Total\n Recovered","$Irecovered",Colors.amberAccent[100],Icons.home,Radius.circular(0),Radius.circular(0),Radius.circular(0),Radius.circular(0)),
                          button("Total\n Deaths","$Ideaths",Colors.amberAccent,Icons.all_inclusive,Radius.circular(10),Radius.circular(0),Radius.circular(0),Radius.circular(10))
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          BuildButton1('StateWise',context,'/statewise')
                        ],
                      ),

                      Row(
                        children: <Widget>[
                          Container(
                            height: SizeConfig.safeBlockVertical * 13, //10 for example
                            width: SizeConfig.safeBlockHorizontal * 100,
                            child: Row(

                              children: <Widget>[ BuildButton('About \nnCovid-19\n'
                                  ,Icons.local_hospital,context,'/about',Colors.amberAccent),
                                BuildButton('\nHELP\n',Icons.help,context,'/help',Colors.amberAccent[100]),
                                BuildButton('WHO \nGuidelines\n',Icons.assignment,context,'/location',Colors.amberAccent),],
                            ),

                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          devcon("Developer's Profile",context,'/devpro')
                        ],

                      ),
                      Divider(height: 1,
                      thickness: 1,
                      color: Colors.lightBlueAccent,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                        Container(
                          height: SizeConfig.safeBlockVertical * 10, //10 for example
                          width: SizeConfig.safeBlockHorizontal * 100,
                          //width: 360,
                         // height: 62,
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                          ),
                          child: Center(
                            child: Stack(
                              children: <Widget>[
                                AnimatedOpacity(
                                  opacity: opacity,
                                  duration: Duration(seconds: 0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.5),
                                    child:
                                      Text('"Stay Home"',
                                      style: TextStyle(
                                        fontSize: SizeConfig.safeBlockHorizontal * 9,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.white
                                      ),
                                      textAlign: TextAlign.center,)),
                                ),
                             AnimatedOpacity(
                              opacity: opacity == 1 ? 0 : 1,
                              duration: Duration(seconds: 0),
                              child: Padding(
                                  padding: const EdgeInsets.all(8.5),
                                  child:
                                  Text('"Stay Safe"',
                                    style: TextStyle(
                                      fontSize:SizeConfig.safeBlockHorizontal * 9,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.white
                                    ),
                                    textAlign: TextAlign.center,))
                             )
                               ],
                            ),
                          ),
                        ),
                        ])
                      ], )
                ],
                  ),
            ),
        ),
      )
      );
  }
}
Widget button(dynamic ButtonText,dynamic Confirmed,color,icons,r,l,bl,br){
  return Flexible(
    child: Container(
      height: SizeConfig.safeBlockVertical * 18.5, //10 for example
      width: SizeConfig.safeBlockHorizontal * 33.3,
          decoration:
          BoxDecoration(
              color: color,
            borderRadius: BorderRadius.only( 
              topRight: r,
                topLeft: l,
              bottomLeft: bl,
              bottomRight: br

            )
            ),
        child: Container(
            margin: EdgeInsets.all(1.0),
            padding: EdgeInsets.all(0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(ButtonText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 4,
                      fontWeight: FontWeight.bold,
                    color: Colors.grey[800]
                  ),),
                 SizedBox(
                   height: SizeConfig.safeBlockVertical *1.5,
                 ),
                 Text(Confirmed,
                 style: TextStyle(
                   fontSize: SizeConfig.safeBlockHorizontal * 6,
                   fontWeight: FontWeight.bold,
                   color: Colors.grey[700]
                 ),),
                Icon(icons)

              ],
            ),
          height: SizeConfig.safeBlockVertical * 18, //10 for example
          width: SizeConfig.safeBlockHorizontal * 33.3,
          ),
        ),
  );



}
Widget BuildButton(String ButtonText,icon,tap,til,col) {
  return Container(
    height: SizeConfig.safeBlockVertical * 13, //10 for example
    width: SizeConfig.safeBlockHorizontal * 33.3,
    color: col,
    child:  OutlineButton(
      //padding:const EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          new Text(ButtonText,
            style: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 4,
              fontWeight: FontWeight.bold,
            ),
          textAlign: TextAlign.center,),
           Icon(icon),
        ],
      ),
      onPressed: () {Navigator.pushNamed(tap,til);},
    ),
  );
}
Widget BuildButton1(String ButtonText,tap,til) {
  return new Expanded(
    child: new Container(
        height: SizeConfig.safeBlockVertical * 9, //10 for example
        width: SizeConfig.safeBlockHorizontal * 100,
      decoration: BoxDecoration(
        border:   Border(
          top: BorderSide(
          color: Colors.lightBlue,
          width: 1),
          bottom: BorderSide(
            color: Colors.lightBlue,
            width: 1)
          )

        ),
      child: Column(
        children: <Widget>[
          Container(
           height: SizeConfig.safeBlockVertical * 8.6, //10 for example
           width: SizeConfig.safeBlockHorizontal * 100,
            decoration: BoxDecoration(
              color: Colors.redAccent
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Text(ButtonText,
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal *10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'BebasN',
                    letterSpacing: 2
                  ),
                  textAlign: TextAlign.center,),
                IconButton(icon: Icon(Icons.keyboard_arrow_down,color: Colors.white,),alignment: Alignment.centerRight,
                onPressed: (){Navigator.pushNamed(tap,til);},),

              ],
            ),
          ),

        ],
      ),



    ),
  );
}
Widget devcon(String ButtonText,tap,til) {
  return Container(
    decoration: BoxDecoration(
      border:Border(
    top: BorderSide(
    color: Colors.lightBlue,
        width: 1),
      bottom: BorderSide(
          color: Colors.lightBlue,
          width: 0,)
  ),
          color: Colors.lightBlueAccent
    ),
    height: SizeConfig.safeBlockVertical * 8, //10 for example
    width: SizeConfig.safeBlockHorizontal * 100,
    child:  OutlineButton(
      //padding:const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(ButtonText,
            style: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 4,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,),
          Icon(Icons.account_circle),
        ],
      ),
      onPressed: () {Navigator.pushNamed(tap,til);},
    ),
  );
}
class indicases{
  dynamic Iconfirmed;
  dynamic Ideaths;
  dynamic Irecovered;
  dynamic lastupdate;
  indicases({this.Iconfirmed,this.Ideaths,this.Irecovered,this.lastupdate});

  factory indicases.fromJson(Map<String,dynamic>json){
    return indicases(
      Iconfirmed: json['confirmed'],
      Ideaths: json['deaths'],
      Irecovered: json['recovered'],
      lastupdate: json['lastupdatedtime']
    );
  }
}


