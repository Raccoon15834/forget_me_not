import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); //myApp is a custom root widget
}

//Try hot reload
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome Page',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(username: 'Bob'), //home attribute
    );
  }
}

class MyHomePage extends StatefulWidget { //stateful widgets always have final (nonmutable?) vars
  const MyHomePage({super.key, required this.username});
  final String username;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
  //set state of stateful widget using setState-rebuild-call of custom State (setter)
}

class _MyHomePageState extends State<MyHomePage> {
  nextpage(){

  }
  String welcomeText = 'Welcome'+widget.username+' Today is ';
  var welcomeWidget = Text(welcomeText, style: TextStyle(color:Color.green, size:100.0));
  var gobutton = ElevatedButton(onPressed: nextpage, child: Text('Let\'s Go!'));

  @override
  Widget build(BuildContext context) {
    return Scaffold( //scaffold has an appbar AND body with widgetlist
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Welcome Page (1)'),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: <widget>[welcomeWidget,gobutton]
        )
      )
    );
  }
}
