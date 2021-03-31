import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HalamanDepan extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HalamanDepanState();


}

class _HalamanDepanState extends State<HalamanDepan> {
  static String tag = 'home-page';
  String nim;
  String nama;
  getDataMahasiswa() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      nim = (prefs.getString('nim') ?? '');
      nama = (prefs.getString('nama') ?? '');
    });
  }

  @override
  void initState() {
    super.initState();
    getDataMahasiswa();
  }

  @override
  Widget build(BuildContext context) {
    final alucard = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/images/logo.png'),
        ),
      ),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Selamat Datang $nama ',
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    final lorem = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        '$nim.',
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.lightBlueAccent,
        ]),
      ),
      child: Column(
        children: <Widget>[alucard, welcome, lorem],
      ),
    );

    return Scaffold(
      body: body,
    );
  }
}
