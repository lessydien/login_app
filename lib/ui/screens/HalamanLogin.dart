import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/model/Mahasiswa.dart';
import 'package:login_app/ui/screens/HalamanDepan.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login_app/const/Constant.dart';


class HalamanLogin extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Halaman login',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyLoginPage(title: 'Login'),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  MyLoginPage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomeLoginState createState() => _MyHomeLoginState();
}

class _MyHomeLoginState extends State<MyLoginPage> {
  bool _tampilpass = true;
  String _username;
  String _pass;
  final mystyle = TextStyle(fontSize: 30 ,  color: Colors.indigo );
  final mytextinput = TextStyle(fontSize: 14 , color: Colors.black);
  final mycontroller = TextEditingController();

  FocusNode focus = FocusNode();

  @override
  void initState(){
    super.initState();
    mycontroller.addListener(_printLatestValue);
    //focus = FocusNode();
  }
  _printLatestValue() {
    print("Second text field: ${mycontroller.text}");
  }


  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    mycontroller.dispose();
    super.dispose();
  }


  final _formKey = GlobalKey<FormState>();

  void tooglePass() {
    setState ((){
      _tampilpass = !_tampilpass;
    });
  }

  void _showAlert(BuildContext context, String status) {
    showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
              title: Text("STATUS LOGIN"),
              content: Text(status),
            )
    );
  }


  Future<void> savePrefDataMahasiswa(String nim, String nama) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("nim", nim);
    prefs.setInt("statuslogin", 1);
    prefs.setString('nama', nama);
  }

  Future<Mahasiswa> loginUser(String user,String pass) async {
    final String apiUrl = apiURL+"/login.php";
    final response = await http.post(Uri.parse(apiUrl), body:{
      'user' : user,
      'pass' : pass,
    });
    if (response.statusCode == 200) {
      return Mahasiswa.fromJson(json.decode(response.body));
    }
    else {
      _showAlert(context, 'ERROR JARINGAN !');
      throw Exception('Failed to load data');
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          child: SingleChildScrollView(
            // margin: EdgeInsets.all(10.0),
            // padding: EdgeInsets.all(10.0),
            // alignment: Alignment.center,
            //width: double.infinity,
            //     height: double.infinity,
            //width:MediaQuery.of(context).size.width
            // height: 200,
            // decoration: BoxDecoration(
            //   gradient: LinearGradient(colors: [
            //     Colors.blue,
            //     Colors.lightBlueAccent,
            //   ]),
            //
            // //   borderRadius: BorderRadius.circular(8.0),
            //   // border: Border.all(),
            //  ),
              padding: const EdgeInsets.all(10.0),
              child: Form(
                  key: _formKey,
                  child: Column (
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                       Row(
                  children: <Widget>[
                       Image(image: AssetImage('assets/images/logo.png')) // Judul
                  ]
                )
                ,
                      Row(
                        // mainAxisSize: MainAxisSize.max,
                        // nim field
                        children: <Widget>[
                          Expanded(
                            child: Text("Username", style: mytextinput),
                          ),

                          //  Flexible(
                          // child:Text(": ", style: mytextinput),
                          //   ),
                          Text(": ", style: mytextinput),
                          Expanded(
                            flex: 3,
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              autofocus: false,
                              onFieldSubmitted: (value){
                                FocusScope.of(context).requestFocus(focus);
                              },
                              //initialValue: 'name@gmail.com',
                              decoration: InputDecoration(
                                // hintText: 'username',
                                //  labelText: 'username',
                                isDense: true,
                                suffixIcon: InkWell(
                                    child: Icon(Icons.person, size: 24),
                                    onTap: () {}
                                ),
                                suffixIconConstraints: BoxConstraints(
                                    minWidth:2,
                                    minHeight:2
                                ),

                                // contentPadding: EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 10.0),
                                // border: OutlineInputBorder(borderRadius: BorderRadius.circular(3.0))
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'username tidak boleh kosong';
                                }
                                return null;
                                //value.isEmpty ? 'username tidak boleh kosong' : null;
                              },
                              onSaved: (value) => _username=value,
                              controller: mycontroller,
                            ),

                          )
                        ],

                      ),
                      Row(
                          children: <Widget>[
                     //        Expanded(
                     //            child:Text("Password", style: mytextinput)
                     //        ),
                     //        /*Flexible(
                     //   child:Text(": ", style: mytextinput),
                     // ),*/
                     //        Text(": ", style: mytextinput),
                     //        Expanded(
                                //flex: 3,
                                 TextFormField(
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.done,
                                    autofocus: false,

                                    decoration: InputDecoration(
                                      suffixIcon: InkWell(
                                          child: Icon( _tampilpass?Icons.visibility :
                                          Icons.visibility_off, size: 24
                                          ),
                                          onTap: tooglePass
                                      ),
                                      suffixIconConstraints: BoxConstraints(
                                          minWidth:2,
                                          minHeight:2
                                      ),
                                      isDense: true,
                                      /*  icon: const Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: const Icon(Icons.lock),
        ),
        */
                                      //  hintText: 'password',
                                        labelText: 'password',

                                      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))
                                    ),
                                    obscureText: _tampilpass,
                                    focusNode: focus,
                                    onSaved: (value) => _pass=value,
                                    validator:(value) {
                                      if (value == null || value.isEmpty) {
                                        return 'password tidak boleh kosong';
                                      }
                                      return null;
                                      //value.isEmpty ? 'username tidak boleh kosong' : null;
                                    }
                                ),
                            // ),
                            //
                            //onPressed: _toggle,
                            //child: new Text(_obscureText ? "Show" : "Hide"))
                          ]
                        // password field
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(height: 20.0,),
                        ],
                      ),
                      Row(
                          children: <Widget>[
                            Expanded(
                                child: OutlinedButton.icon(
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      //  ScaffoldMessenger.of(context)
                                      //     .showSnackBar(SnackBar(content: Text('Processing Data')));
                                      print('proses data');
                                      _formKey.currentState.save();
                                      // simpan ke object user
                                      // object ini kirim ke server untuk di cek
                                      // klo berhasil
                                      print('$_username');
                                      final Mahasiswa dataMahasiswa = await loginUser(
                                          _username, _pass);
                                      // setState(() {
                                      //     mydata = datax;
                                      // });
                                      if (dataMahasiswa.nim != null) {
                                        savePrefDataMahasiswa(dataMahasiswa.nim,
                                            dataMahasiswa.nama).then((value) {
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return HalamanDepan();
                                              },
                                            ),
                                          );
                                        });
                                      }
                                    }


                                    else {
                                      print('tidak valid');
                                    }

                                  },
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder> (
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20.0)
                                        )
                                    ),
                                    backgroundColor: MaterialStateProperty.all(Colors.white),
                                    elevation: MaterialStateProperty.all(2.0),
                                    side: MaterialStateProperty.all(
                                        BorderSide(
                                            color: Colors.deepOrange,
                                            width: 1.0,
                                            style: BorderStyle.solid

                                        )
                                    ),
                                    textStyle: MaterialStateProperty.all(
                                        TextStyle(
                                          color: Colors.black,
                                        )
                                    ),
                                  ),
                                  label : const Text("Login"),
                                  icon: Icon(
                                    Icons.login,
                                    size: 24.0,
                                    color: Colors.deepOrange,
                                  ),
                                )
                            )
                          ]
                      )
                    ],

                  )
              )
          ),
        )
    );
  }
}

