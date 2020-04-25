import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import'package:http/http.dart';
import 'package:CoronaVirusTracker/service/screenconfig.dart';
class statedata extends StatefulWidget {
  @override
  _statedataState createState() => _statedataState();
}
class _statedataState extends State<statedata> {
  var rest;
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  Future<List<stacases>> getData() async {
    String link =
       "https://api.covid19india.org/data.json";
    var res = await get(link);
    var data = json.decode(res.body)["statewise"];
    rest = data;
    List<stacases> lists = [];
    print(rest[20]["state"]);
    for(var u in data){
      stacases list = stacases(u["state"],u["confirmed"],u["active"],u["recovered"],u["deaths"]);
      lists.add(list);
    }
    print(lists.length);
    return lists;
  }
  @override
  void initState() {
    super.initState();
    this.getData();
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
        backgroundColor: Colors.blueGrey[700],
        bottomNavigationBar:
            Container(
              color: Colors.amberAccent,
              child: Text('PULL TO REFRESH',
              style:TextStyle(
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,),
            ),
          body:Stack(
           children: <Widget>[
             FutureBuilder(
                      future: getData(),
                      builder: (BuildContext context, AsyncSnapshot snapshot){
                        print(snapshot.data);
                        if (rest == null) {
                          return Container(
                            child: Center(child: CircularProgressIndicator(
                              backgroundColor: Colors.red ,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.amberAccent)
                                     )),
                                   );
                           } else {
                            return RefreshIndicator(
                              displacement: 100,
                              key: refreshKey,
                              child: ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    SizeConfig().init(context);
                                    return Container(
                                        //height: SizeConfig.safeBlockVertical * 100, //10 for example
                                        //width: SizeConfig.safeBlockHorizontal * 100,
                                            child: Column(children: <Widget>[
                                              Table(
                                                  border: TableBorder.all( color: Colors.blueGrey,width:SizeConfig.blockSizeHorizontal*0.3,),
                                                      columnWidths: {0: FractionColumnWidth(.3)},
                                                      children: [
                                                        TableRow( children: [
                                                        Padding(
                                                            padding: const EdgeInsets.all(5.0),
                                                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                                children:[
                                                                  Text(snapshot.data[index].state,
                                                                      style: TextStyle(
                                                                          fontSize: SizeConfig.safeBlockHorizontal *5,
                                                                          fontWeight: FontWeight.bold,
                                                                          color: Colors.white,
                                                                          fontFamily: 'Titill'
                                                                      ),
                                                                      textAlign: TextAlign.justify
                                                                  )]),
                                                          ),
                                                        Padding(
                                                            padding: const EdgeInsets.all(6.0),
                                                            child: Column(
                                                              children: [
                                                              Text(snapshot.data[index].confirmed,
                                                                style: TextStyle(
                                                                    fontSize:SizeConfig.safeBlockHorizontal *5.5,
                                                                    fontFamily: 'Titill',
                                                                  color: Colors.white70
                                                                ),
                                                                textAlign: TextAlign.center,)
                                                            ],),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.all(6.0),
                                                            child: Column(children: [
                                                              Text(snapshot.data[index].active,
                                                                style: TextStyle(
                                                                    fontSize: SizeConfig.safeBlockHorizontal *5.5,
                                                                    fontFamily: 'Titill',
                                                                    color: Colors.white70
                                                                ),
                                                                textAlign: TextAlign.justify,)
                                                            ],),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.all(6.0),
                                                            child: Column(children: [
                                                              Text(snapshot.data[index].recovered,
                                                                style: TextStyle(
                                                                    fontSize:SizeConfig.safeBlockHorizontal *5.5,
                                                                    fontFamily: 'Titill',
                                                                    color: Colors.white70
                                                                ),
                                                                textAlign: TextAlign.justify,)
                                                            ],),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.all(6.0),
                                                            child: Column(children: [
                                                              Text(snapshot.data[index].deaths,
                                                                style: TextStyle(
                                                                    fontSize: SizeConfig.safeBlockHorizontal *5.5,
                                                                    fontFamily: 'Titill',
                                                                    color: Colors.white70
                                                                ),
                                                                textAlign: TextAlign.justify,)
                                                            ],),
                                                          ),
                                                        ])])])
                                        ); }
                              ),
                              onRefresh: refreshList,
                            );
                            }
                          }
                          ),
           Container(
            height: SizeConfig.blockSizeVertical * 11, //10 for example
            width: SizeConfig.blockSizeHorizontal * 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(width:SizeConfig.blockSizeHorizontal*1,),
                    Text('STATE',
                    style: TextStyle(
                      fontSize:SizeConfig.blockSizeHorizontal*8,
                      fontFamily: 'Titill',
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                    ),
                    SizedBox(width:SizeConfig.blockSizeHorizontal*9,),
                    Text('CARD',
                      style: TextStyle(
                          fontSize:SizeConfig.blockSizeHorizontal*8,
                          fontFamily: 'Titill',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        letterSpacing:SizeConfig.blockSizeHorizontal*12
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    SizedBox(width:SizeConfig.blockSizeHorizontal*33,),
                    Text('Confirmed',
                    style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal *3.2
                    ),),
                    SizedBox(width:SizeConfig.blockSizeHorizontal*5,),
                    Text('Active',
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal *3.2
                      ),),
                    SizedBox(width:SizeConfig.blockSizeHorizontal*5,),
                    Text('Recovered',
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal *3.2
                      ),),
                    SizedBox(width:SizeConfig.blockSizeHorizontal*5,),
                    Text('Deaths',
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal *3.2
                      ),),
                  ],
                ),

              ],
            ),
            decoration: BoxDecoration(
                color: Colors.redAccent
            ),
           ), ] )),
    );
  }
}
class stacases{
 final dynamic confirmed;
  final dynamic deaths;
 final dynamic recovered;
 final dynamic active;
 final dynamic state;
  stacases(this.state,this.confirmed,this.active,this.recovered,this.deaths);
}