import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); //myApp is a custom root widget
}

//Try hot reload
class MyApp extends StatelessWidget {
  const MyApp({super.key}); //when making a widget, override build method that constructs the widget

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //material app is usually root widget type, set 3 attributes, 3 commas?
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'), //home attribute
    );
  }
}

class MyHomePage extends StatefulWidget { //stateful widgets always have final (nonmutable?) vars
  const MyHomePage({super.key, required this.title});

  final String title;
  //was the title parameter passed, this var?

  @override
  State<MyHomePage> createState() => _MyHomePageState();
  //set state of stateful widget using setState-rebuild-call of custom State (setter)
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  //myHomePage stateful widget is gonna be a Scaffold (in essence containing a TON of other widgets
  //you set all stateful widget stuff in the State<customWidgetName>
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object THE TITLE!!!
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          //Column is also a layout widget. It takes a list of children and arranges them vertically.

          mainAxisAlignment: MainAxisAlignment.center,
          //widget children array
          //to make an array, define type first
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',//use dollar sign and then variable in text
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],//finishes the array of widgets
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
