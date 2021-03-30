import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/HalamanUtama.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Halaman login',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyLoginPage(title: 'Login'),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  MyLoginPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomeLoginState createState() => _MyHomeLoginState();
}

class _MyHomeLoginState extends State<MyLoginPage> {
  bool _tampilpass = true;
  String _username;
  final mystyle = TextStyle(fontSize: 30 ,  color: Colors.indigo );
  final mytextinput = TextStyle(fontSize: 14 , color: Colors.black);
  final mycontroller = TextEditingController();


  // final userfield = TextFormField(
  //   textInputAction: TextInputAction.next,
  //   keyboardType: TextInputType.emailAddress,
  //   autofocus: false,
  //   //initialValue: 'name@gmail.com',
  //   decoration: InputDecoration(
  //   // hintText: 'username',
  //   //  labelText: 'username',
  //     //contentPadding: EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 10.0),
  //  // border: OutlineInputBorder(borderRadius: BorderRadius.circular(3.0))
  //   ),
  //   // validator: (value) {
  //   //   if (value == null || value.isEmpty) {
  //   //     return 'username tidak boleh kosong';
  //   //   }
  //   //   return null;
  //   //   //value.isEmpty ? 'username tidak boleh kosong' : null;
  //   // },
  //   //onSaved: (value) => _username=value,
  // );

  // final passfield = TextFormField(
  //     keyboardType: TextInputType.text,
  //     autofocus: false,
  //     decoration: InputDecoration(
  //     /*  icon: const Padding(
  //         padding: const EdgeInsets.only(top: 15.0),
  //         child: const Icon(Icons.lock),
  //       ),
  //       */
  //     //  hintText: 'password',
  //    //  labelText: 'password',
  //
  //       //contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
  //      //border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))
  //     ),
  //   obscureText: true,
  //  // focusNode: focus,
  // );
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
               /* Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                       Text("Halaman Login", style: mystyle) // Judul
                  ]
                )
                ,*/
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
                     Expanded(
                         child:Text("Password", style: mytextinput)
                     ),
                     /*Flexible(
                       child:Text(": ", style: mytextinput),
                     ),*/
                     Text(": ", style: mytextinput),
                     Expanded(
                         flex: 3,
                         child: TextFormField(
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
                             //  labelText: 'password',

                             //contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                             //border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))
                           ),
                           obscureText: _tampilpass,
                           focusNode: focus,
                         )
                     ),

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
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(content: Text('Processing Data')));
                              print('proses data');
                              _formKey.currentState.save();
                              // simpan ke object user
                              // object ini kirim ke server untuk di cek
                              // klo berhasil
                             print('$_username');
                            // pengecekan ke API data menggunakan http connection
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => HalamanUtama()),
                              );
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

