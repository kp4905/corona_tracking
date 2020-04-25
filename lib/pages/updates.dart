import 'package:CoronaVirusTracker/service/news.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import'package:http/http.dart';
import 'dart:convert';
import 'package:CoronaVirusTracker/service/screenconfig.dart';
import 'package:intl/intl.dart';

class updates extends StatefulWidget {

  @override
  _updatesState createState() => _updatesState();
}

class _updatesState extends State<updates> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  var rest;
  Future<List<updatedata>> getData() async {
    String link =
        "https://api.covid19india.org/updatelog/log.json";
    var res = await get(link);
    var data = json.decode(res.body);
    rest = data;
    List<updatedata> lists = [];
    print(rest[0]["update"]);
    for(var u in data){
      updatedata list = updatedata(u["update"],u["timestamp"]);
      lists.add(list);
    }
    print(lists.length);
    return lists;
  }

  @override
  void initState() {
    super.initState();
    getData();
    refreshList();
  }
  Future<Null> refreshList() async {
    refreshKey.currentState?.show(atTop: true);
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      rest = null;
      getData();

    });
  }


  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Live Updates'),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        backgroundColor: Colors.blueGrey,
       body: Stack(
         children:<Widget>[
           FutureBuilder(
             future: getData(),
             builder: (BuildContext context, AsyncSnapshot snapshot){
                print(snapshot.data);
                if (rest==null){
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),

                    ),
                  );
                }
                else{
                return RefreshIndicator(
                  key: refreshKey,
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index){
                        SizeConfig().init(context);
                        return Card(
                          margin: EdgeInsets.fromLTRB(16.0,16.0,16.0,0.0),
                          child:
                            Padding(
                              padding: EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Text(snapshot.data[snapshot.data.length - index-1].update,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:SizeConfig.safeBlockHorizontal *4,
                                  ),),
                                  Text(timeAgo(snapshot.data[snapshot.data.length - index-1].timestamp,),
                                  style: TextStyle(
                                    color: Colors.grey,

                                  ),
                                  )
                                ],
                              ),
                            )

                        );
                      }
                  ),
                  onRefresh: refreshList,
                );}

             }

           )


      ]
       ),)
    );
  }
}
readTimestamp(int timestamp) {
  var now = DateTime.now();
  var format = DateFormat('HH:mm a');
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  var diff = now.difference(date);
  var time = '';

  if (diff.inSeconds <= 0 || diff.inSeconds > 0 && diff.inMinutes == 0 || diff.inMinutes > 0 && diff.inHours == 0 || diff.inHours > 0 && diff.inDays == 0) {
    time = format.format(date);
  } else if (diff.inDays > 0 && diff.inDays < 7) {
    if (diff.inDays == 1) {
      time = diff.inDays.toString() + ' DAY AGO';
    } else {
      time = diff.inDays.toString() + ' DAYS AGO';
    }
  } else {
    if (diff.inDays == 7) {
      time = (diff.inDays / 7).floor().toString() + ' WEEK AGO';
    } else {

      time = (diff.inDays / 7).floor().toString() + ' WEEKS AGO';
    }
  }
  print(time);
  return time;

}
timeAgo(timestamp) {
  var now= DateTime.now();
  var format = DateFormat('HH:mm a');
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  Duration diff = DateTime.now().difference(date);
  if (diff.inDays > 365)
    return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "year" : "years"} ago";
  if (diff.inDays > 30)
    return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "month" : "months"} ago";
  if (diff.inDays > 7)
    return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "week" : "weeks"} ago";
  if (diff.inDays > 0)
    return "${diff.inDays} ${diff.inDays == 1 ? "day" : "days"} ago";
  if (diff.inHours > 0)
    return "${diff.inHours} ${diff.inHours == 1 ? "hour" : "hours"} ago";
  if (diff.inMinutes > 0)
    return "${diff.inMinutes} ${diff.inMinutes == 1 ? "minute" : "minutes"} ago";
  return "just now";
}

class updatedata{
  final dynamic update;
  final dynamic timestamp;
  updatedata(this.update,this.timestamp);
}

