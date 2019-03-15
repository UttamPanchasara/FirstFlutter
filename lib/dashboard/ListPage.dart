import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/common/ShowProgress.dart';
import 'package:flutter_login/dashboard/PrepareList.dart';
import 'package:flutter_login/model/Events.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/services.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Events> eventList;
  Position _position;

  @override
  void initState() {
    super.initState();
    _initPlatformState();
  }

  Future getEvents() async {
    var fireInstance = Firestore.instance;
    QuerySnapshot qn = await fireInstance.collection("events").getDocuments();
    return qn.documents;
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> _initPlatformState() async {
    Position position;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      final Geolocator geolocator = Geolocator();
      //..forceAndroidLocationManager = true;
      position = await geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    } on PlatformException {
      position = null;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return;
    }

    setState(() {
      _position = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GeolocationStatus>(
        future: Geolocator().checkGeolocationPermissionStatus(),
        builder:
            (BuildContext context, AsyncSnapshot<GeolocationStatus> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.data == GeolocationStatus.disabled) {
            return Center(
              child: Text(
                'Location services disabled Enable location services for this App using the device settings.',
                style: TextStyle(color: Colors.black),
              ),
            );
          }

          if (snapshot.data == GeolocationStatus.denied) {
            return Center(
              child: Text(
                'Access to location denied Allow access to the location services for this App using the device settings.',
                style: TextStyle(color: Colors.black),
              ),
            );
          }

          if (_position == null) {
            return Center(
              child: Text(
                'Looking for Location',
                style: TextStyle(color: Colors.black),
              ),
            );
          } else {
            return _fetchEvents(_position);
          }
        });
  }

  Widget _fetchEvents(Position position) {
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
                  return ShowProgress();
                default:
                  return PrepareList(snapshot.data);
              }
            }
          }),
    );
  }
}
