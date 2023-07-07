import 'package:flutter/material.dart';
import 'submain.dart';
//both myApp and MyHomePage are custom classes that work to return a MaterialApp-home, Scaffold-body

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
        fontFamily: 'Lora',
      ),
      home: const MyHomePage(username: 'Bob'), //home attribute
    );
  }
}

class MyHomePage extends StatefulWidget { //stateful widgets always have final (nonmutable?) vars
  const MyHomePage({super.key, required this.username});
  final String username; //initializing variable


  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
  //set state of stateful widget using setState-rebuild-call of custom State (setter)
}

class _MyHomePageState extends State<MyHomePage>  {
  String date = 'curr';
  double size = 100.0;
  void nextpage(){
    setState(() {
      date = 'new Curr';
      size=200;
    }); //changing variable
    Navigator.push(context, MaterialPageRoute(builder: (context)=> const MyAppRte2()));
  }

  //late final AnimationController myAnimCon;
  // @override
  // void initState() {
  //   // entry point of a state widget
  //   myAnimCon = AnimationController(
  //       vsync: this,
  //   );
  //
  //   super.initState();
  // }
  // @override
  // void dispose() {
  //   super.dispose();
  //   myAnimCon.dispose();
  // }

  var txtStyle = const TextStyle(color:Color.fromARGB(100, 100, 100, 100),fontSize: 90.0,fontFamily: 'Bakery');
  //Ctrl P shows you valid parameters

  @override
  Widget build(BuildContext context) {
    return Scaffold( //scaffold has an appbar AND body with widgetlist
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Welcome Page (1)'),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[// DO NOT CONST ANYTHING THAT HAS VARIABLES
            Text('Welcome ${widget.username}', style: txtStyle,textAlign: TextAlign.center,),
            Text('The date is $date'),
            ElevatedButton(onPressed: nextpage, child:
              AnimatedSize(
                curve: Curves.easeIn,
                duration: const Duration(seconds: 1),
                child:  Icon(Icons.cake_rounded, size: size,),
              ),
            )
          ]
        )
      )
    );
  }
}
//second Page has different scaffold BUT SAME material app?
//can define multiple routes in material app, name their rte name using super.key?
class MyAppRte2 extends StatelessWidget{
  const MyAppRte2({super.key});

  @override
  Widget build(BuildContext context) {
    void _back(){
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Birthdays Page'),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 10,
            fit: FlexFit.loose,
            child: BdayList(bdays: [],),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child:Container(
              child:TextButton(child: Text('Go back'),onPressed: _back,),
              color: Colors.cyan,
              height: 300,
              width: double.infinity,
            ),
          ),
        ],
      )
    );
  }
}


class BdayList extends StatefulWidget{
  const BdayList({super.key, required this.bdays });
  final List<Bday> bdays;

  @override
  State<StatefulWidget> createState() {
    return _MyBdayListState(bdays);
  }
}
class _MyBdayListState extends State<BdayList>{
  late List<Bday> bdays;
  _MyBdayListState(bdays){
    this.bdays=bdays;
  }
  void newCard(){
    setState(() {
      bdays.add(Bday('name', DateTime.utc(0,0,0,0)));
      debugPrint(bdays.length.toString());
      //TODO: for every page reload, render the list, for every newcard add ONE to top by SORTING
    });
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      children:[Card(clipBehavior: Clip.hardEdge,
          elevation: 10, margin: const EdgeInsets.all(30),color: Colors.lightGreenAccent,
          child: InkWell(
            onTap: newCard,
            splashColor: Colors.green,
            highlightColor: Colors.greenAccent,
            child: Container(padding: const EdgeInsets.all(10), child: const Row(children: [Icon(Icons.add_circle), Text('  Add Bday')],)),
          )
      ), ...buildBdayCards(bdays)
      ]
    );
  }
}



