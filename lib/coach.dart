import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import 'Coachdata.dart';

class CoachData1 extends StatefulWidget {


  @override
  _CoachDataState createState() => _CoachDataState();
}

class _CoachDataState extends State<CoachData1> {
  late Query _ref;
  List<Coach> datalist =[];

  @override
  void initstate() {
// TODO: implement initState
    super.initState();
    DatabaseReference referenceData = FirebaseDatabase.instance.reference().child("Data");
    referenceData.once().then((DataSnapshot dataSnapshot) {
    datalist.clear();
    var keys = dataSnapshot.value. keys;
    var values = dataSnapshot.value;

    for (var key in keys) {
    Coach data = new Coach(
      values[key]['name'],
      values[key]['mailid']
    );
    datalist.add(data);
    }
    setState((){

      });
    });
  }
  Widget CardUI (String name, String mailid) {
    return Card(
      margin: EdgeInsets.all(15),
      color: Color(0xffff2fc3),
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.all(1.5),
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Text(name),
            SizedBox(height: 1),
            Text(name, style: TextStyle(color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
            SizedBox(height: 1),
            Text(mailid),
            SizedBox(height: 1),
            Container(
              width: double.infinity,
              child: Text(
                  mailid, style: TextStyle(color: Colors.red, fontSize: 20)),),
            SizedBox(height: 1),
          ],
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coach'),
      ),
        body: datalist.length==0 ? Center(child: Text("No Data Available", style: TextStyle(fontSize: 30))) : ListView.builder(
    itemCount: datalist.length,
    itemBuilder: (_,index) {
      return CardUI(datalist[index].name, datalist[index].mailid);
    }
    ), // ListView.builder
    ); // Scaffold
}
  }
