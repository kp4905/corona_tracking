import 'package:CoronaVirusTracker/pages/updates.dart';
import 'package:flutter/material.dart';
import 'package:CoronaVirusTracker/pages/about_page.dart';
import  'package:CoronaVirusTracker/pages/help_page.dart';
import 'package:CoronaVirusTracker/pages/loading.dart';
import 'package:CoronaVirusTracker/pages/choose_location.dart';
import 'package:CoronaVirusTracker/service/statewise_i.dart';
import 'package:CoronaVirusTracker/pages/devcon.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
 initialRoute:'/' ,
  routes:{
    '/':(context)=>loading(),
    '/location':(context)=>whoguide(),
    '/about':(context)=>about(),
    '/help':(context)=>help(),
    '/statewise':(context)=>statedata(),
     '/Updates':(context)=>updates(),
      '/devpro':(context)=>KPcard()},
));

