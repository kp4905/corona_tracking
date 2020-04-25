import 'dart:convert';
import'package:http/http.dart';
import 'package:CoronaVirusTracker/pages/loading.dart';
class news {
  dynamic update;
  dynamic time;
  var rest;
  Future<List<indicases>> getnData() async {
    List<indicases> list;
    String link =
        "https://api.covid19india.org/data.json";
    var res = await get(link);
    var data = json.decode(res.body);
    rest = data;
    update = rest[0]["update"];
    time = rest[0];
    print(update);

  }
}