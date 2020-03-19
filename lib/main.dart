//import 'dart:html';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
        primarySwatch: Colors.green,
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
  int _counter = 0;
  var textDisplay = "";
  final myController = TextEditingController();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _reduceCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter--;
    });
  }

  void _addText() {
    setState(() {
      //myController.text = "Bruno Tentative";
      textDisplay = myController.text;
      if (textDisplay != "") {
        myList = List.from(myList)..add(textDisplay);
      }
      myController.text = "";
    });
  }

  void _updateTextDisplay() {
    setState(() {
      textDisplay = myController.text;
    });
  }

  void _restartCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter = 0;
      myController.text = "";
      myList = [];
      textDisplay = "";
    });
  }

  void _nextPage() {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) =>
                new SecondPage(list: myList, counter: _counter)));
  }

  List<String> myList = ["1", "2", "Third", "4"];

  @override
  Widget build(BuildContext context) {
    var buttons = Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FloatingActionButton(
            onPressed: _reduceCounter,
            tooltip: 'Reduce',
            child: Icon(Icons.remove),
            backgroundColor: Colors.pink,
            heroTag: "reduceButton",
          ),
          FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: Icon(Icons.add),
              heroTag: "incrementButton"),
        ]);

    var restartButton = FloatingActionButton(
        onPressed: _restartCounter,
        child: Icon(Icons.settings_backup_restore),
        backgroundColor: Colors.grey,
        heroTag: "restartButton");

    var addTextButton = FloatingActionButton(
        onPressed: _addText,
        child: Icon(Icons.border_color),
        backgroundColor: Colors.blue,
        heroTag: "addTextButton");

    var displayTextButton = FloatingActionButton(
        onPressed: _updateTextDisplay,
        child: Icon(Icons.format_color_text),
        backgroundColor: Colors.grey,
        heroTag: "dislpayTextButton");

    var nextPageButton = FloatingActionButton(
        onPressed: _nextPage,
        child: Icon(Icons.navigate_next),
        backgroundColor: Colors.black54,
        heroTag: "nextPageButton");

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(""),
            Text(
              'You have clicked the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display2,
            ),
            buttons,
            Text(""),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: myController,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0), isDense: true),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  //padding: const EdgeInsets.all(0),
                  itemCount: myList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(title: Text('${myList[index]}'));
                  }),
            ),
            Text(textDisplay),
            Text(""),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Expanded(child: restartButton),
              Expanded(child: displayTextButton),
              Expanded(child: addTextButton),
              Expanded(child: nextPageButton),
            ]),
            Text(""),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  int counter;
  final List<String> list;

  SecondPage({Key key, @required this.list, this.counter}) : super(key: key);

  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            //title: Text(widget.title),
            ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Expanded(
                child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(title: Text('${list[index]}'));
                    }),
              ),
              Expanded(child: Text("$counter"))
            ])));
  }
}
