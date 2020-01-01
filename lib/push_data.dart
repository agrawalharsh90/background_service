import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
//import 'package:workmanager/workmanager.dart';

class FirebaseDemoScreen extends StatelessWidget {
  final databaseReference = FirebaseDatabase.instance.reference();

//  Future callbackDispatcher() async {
//    Workmanager.executeTask((task) {
//      print("Native called background task"); //simpleTask will be emitted here.
//      return Future.value(true);
//    });
//  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Connect'),
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            child: Text('Create Record'),
            onPressed: () {
              createRecord();
            },
          ),
          RaisedButton(
            child: Text('View Record'),
            onPressed: () {
              getData();
            },
          ),
          RaisedButton(
            child: Text('Udate Record'),
            onPressed: () {
              updateData();
            },
          ),
          RaisedButton(
            child: Text('Delete Record'),
            onPressed: () {
              deleteData();
            },
          ),
        ],
      )), //center
    );
  }

  void createRecord() {
    databaseReference
        .child("1")
        .set({'title': 'Title 1', 'description': 'description 1'});
    databaseReference
        .child("2")
        .set({'title': 'Title 2', 'description': 'description 2'});
  }

  void getData() {
    databaseReference.once().then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
    });
  }

  void updateData() {
    databaseReference.child('1').update({'description': 'update description'});
  }

  void deleteData() {
    databaseReference.child('1').remove();
  }
}
