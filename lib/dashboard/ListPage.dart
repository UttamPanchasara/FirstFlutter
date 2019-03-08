import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_login/model/Events.dart';
import 'package:transparent_image/transparent_image.dart';
import "package:intl/intl.dart";

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Events> eventList;

  Future getEvents() async {
    var fireInstance = Firestore.instance;
    QuerySnapshot qn = await fireInstance.collection("events").getDocuments();

    /*qn.documents.forEach((document) {
      eventList.add(Events.fromJson(document.data));
    });*/

    return qn.documents;
  }

  @override
  Widget build(BuildContext context) {
    var numberFormat = NumberFormat.currency(
        symbol: String.fromCharCode(0163), decimalDigits: 0);

    return Container(
      child: FutureBuilder(
          future: getEvents(),
          builder: (_, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Error: ${snapshot.error}',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              );
            } else {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: SizedBox(
                              width: 20.0,
                              height: 20.0,
                              child: CircularProgressIndicator()),
                        ),
                        Center(
                          child: Text(
                            "Fetching data..",
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  );
                default:
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (_, index) {
                        var event = Events.fromJson(snapshot.data[index]);

                        //var data = snapshot.data[index];
                        return Card(
                          color: Colors.white,
                          clipBehavior: Clip.antiAlias,
                          elevation: 5,
                          margin: EdgeInsets.only(
                              top: 5, bottom: 5, left: 10, right: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Stack(children: <Widget>[
                            Column(
                              children: <Widget>[
                                Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    Center(
                                      child: SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: FadeInImage.memoryNetwork(
                                        height: 190,
                                        fit: BoxFit.cover,
                                        placeholder: kTransparentImage,
                                        image: event.eventPoster,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 15, right: 15, top: 10, bottom: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                event.eventName.toString(),
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Icon(
                                                  Icons.location_on,
                                                  color:
                                                      Colors.deepPurpleAccent,
                                                  size: 15,
                                                ),
                                                Text(
                                                  "5 km",
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: <Widget>[
                                            Text(
                                              '${numberFormat.format(event.eventTicketPrice) ?? ""}',
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  color:
                                                      Colors.deepPurpleAccent),
                                            ),
                                            Text(
                                              '/per day',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.all(10),
                                  width: 30,
                                  height: 30,
                                  decoration: ShapeDecoration(
                                    color: Colors.pink,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  child: Icon(Icons.favorite,
                                      color: Colors.deepPurpleAccent),
                                ),
                              ],
                            ),
                          ]),
                        );
                      });
              }
            }
          }),
    );
  }
}
