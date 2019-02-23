import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter One',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.cyan,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//  int _counter = 0;
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myController1.dispose();
    myController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(title: Text("Attendance")),
      body: new Container(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: new Column(
            children: <Widget>[
              TextField(
                controller: myController1,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: Colors.blue)),
                    hintText: 'Conducted Hours',
                ),
              ),
              TextField(
                controller: myController2,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: Colors.blue)),
                    hintText: 'Bunked till now'
                ),
              ),
              Expanded(child: new Divider(),),
              RaisedButton(
                child: Text("CALCULATE"),
                onPressed: (){
                  int con=int.parse(myController1.text);
                  int ab=int.parse(myController2.text);
                  int pr=con-ab;
                  int pp1=100*pr;
                  double pp2=(pp1/con);
                  String s;
                  if(pp2>75)
                    {pp2=(con-(4*ab))/3;
                    s="No of classes you can leave\n";}
                  else {
                    pp2 = ((4 * ab) - con).toDouble();
                    s = "No of classes YOU HAVE TO ATTEND\n";
                  }
                   return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        // Retrieve the text the user has typed in using our
                        // TextEditingController
                        content: Text(s+pp2.toInt().toString()),
                      );
                    },
                  );
                },
              )
    ],
    ),
      ),
    ),

    /*drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('OLA'),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage('assets/image.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              title: Text('TILE 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('TILE 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('TILE 3'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('TILE 4'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('TILE 5'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),*/
    );
  }
}