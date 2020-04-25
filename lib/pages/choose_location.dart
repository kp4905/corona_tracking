import 'package:flutter/material.dart';

class whoguide extends StatefulWidget {
  @override
  _whoguideState createState() => _whoguideState();
}
class _whoguideState extends State<whoguide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title:Text('WHO Guidelines',
        style: TextStyle(
          fontSize: 20,
        )
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.asset('images/handshaking.png'),
            Divider(thickness: 2,
            height: 2,
            color: Colors.lightBlue,),
            Image.asset('images/safe-greetings.png'),
            Divider(thickness: 2,
              height: 2,
              color: Colors.lightBlue,),
            Image.asset('images/wearing-gloves.png')
          ],
        ),
      ),
    );
  }
}

