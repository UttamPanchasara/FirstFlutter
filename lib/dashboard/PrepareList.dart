import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/model/Events.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';

class PrepareList extends StatefulWidget {
  List<DocumentSnapshot> data;

  PrepareList(List<DocumentSnapshot> data) {
    this.data = data;
  }

  @override
  _PrepareListState createState() => _PrepareListState(data);
}

class _PrepareListState extends State<PrepareList> {
  List<DocumentSnapshot> data;

  _PrepareListState(List<DocumentSnapshot> data) {
    this.data = data;
  }

  @override
  Widget build(BuildContext context) {
    var numberFormat = NumberFormat.currency(
        symbol: String.fromCharCode(0163), decimalDigits: 0);

    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (_, index) {
          var event = Events.fromJson(data[index].data);

          //var data = snapshot.data[index];
          return Card(
            color: Colors.white,
            clipBehavior: Clip.antiAlias,
            elevation: 5,
            margin: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  event.eventName.toString(),
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.deepPurpleAccent,
                                    size: 15,
                                  ),
                                  Text(
                                    "5 km",
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                '${numberFormat.format(event.eventTicketPrice) ?? ""}',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.deepPurpleAccent),
                              ),
                              Text(
                                '/per day',
                                style:
                                    TextStyle(fontSize: 10, color: Colors.grey),
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
                    child: Icon(Icons.favorite, color: Colors.deepPurpleAccent),
                  ),
                ],
              ),
            ]),
          );
        });
  }
}
