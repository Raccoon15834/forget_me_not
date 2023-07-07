import 'package:flutter/material.dart';
class Bday{
  String name="";
  DateTime date=DateTime.utc(0,0,0,0);
  Bday(String name, DateTime date){
    this.name= name;
    this.date = date;
  }
}
List<Card> buildBdayCards(List<Bday> bdays){
  List<Card> bdayCards = [];
  //bdays.sort()
  for(Bday i in bdays){
    bdayCards.add(Card(clipBehavior: Clip.hardEdge,
        elevation: 10, margin: const EdgeInsets.all(30),color: Colors.deepPurple,
        child: InkWell(
          splashColor: Colors.green,
          highlightColor: Colors.greenAccent,
          child: Container(padding: const EdgeInsets.all(10), child:  Row(children: [Text(i.name), Text('  '+i.date.toString())],)),
        )
    ));
  }

  return bdayCards;
}