import 'dart:convert';
import'package:http/http.dart';
class worldcases {
  dynamic Confirmed;
  dynamic Recovered;
  dynamic Deaths;
  dynamic Date;
  Future<void> getcases() async {
    Response response = await get('https://covidapi.info/api/v1/global');
    Map data = jsonDecode(response.body);
    print(response.body);
    dynamic date = data['date'];
    dynamic confirmed = data['result']['confirmed'];
    dynamic deaths = data['result']['deaths'];
    dynamic recovered = data['result']['recovered'];
    Date = date;
    Confirmed=confirmed;
    Deaths=deaths;
    Recovered=recovered;
  }
}


