import 'dart:convert';
import'package:http/http.dart';
import 'package:CoronaVirusTracker/pages/loading.dart';
class indiancases {
  dynamic Confirmed;
  dynamic Recovered;
  dynamic Deaths;
  dynamic LastupDate;
  dynamic date;
  dynamic state;
  var rest;
  Future<List<indicases>> getData() async {
    List<indicases> list;
    String link =
        "https://api.covid19india.org/data.json";
    var res = await get(link);
    var data = json.decode(res.body);
       rest = data["statewise"] ;
       state= rest;
      Deaths = rest[0]["deaths"];
      Recovered = rest[0]["recovered"];
      Confirmed = rest[0]["confirmed"];
      LastupDate= rest[0]["lastupdatedtime"];
      date=rest[0]["lastupdatedtime"].substring(0,10);
      print(date);
  }
}