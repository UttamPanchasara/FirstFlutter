import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  Future getEvents() async {
    var fireInstance = Firestore.instance;
    QuerySnapshot qn = await fireInstance.collection("events").getDocuments();
    return qn.documents;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: getEvents(),
          builder: (_, snapshot) {
            if (snapshot.hasError) {
              return new Text('Error: ${snapshot.error}');
            } else {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: CircularProgressIndicator(),
                        ),
                        Center(
                          child: Text("Fetching data.."),
                        )
                      ],
                    ),
                  );
                default:
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (_, index) {
                        return ListTile(
                          title: Text(snapshot.data[index].data["eventName"]),
                        );
                      });
              }
            }
          }),
    );
  }
}
