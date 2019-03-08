import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

Events eventsFromJson(String str) {
  final jsonData = json.decode(str);
  return Events.fromJson(jsonData);
}

String eventsToJson(Events data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

const String eventId = "eventId";
const String eventName = "eventName";
const String eventLocation = "eventLocation";
const String eventLatLong = "eventLatLong";
const String eventTicketPrice = "eventTicketPrice";
const String eventDate = "eventDate";
const String eventPoster = "eventPoster";
const String eventDescription = "eventDescription";
const String eventMedia = "eventMedia";
const String eventContacts = "eventContacts";

class Events {
  int eventId;
  String eventName;
  String eventLocation;
  EventLatLong eventLatLong;
  int eventTicketPrice;
  int eventDate;
  String eventPoster;
  String eventDescription;
  List<EventMedia> eventMedia;
  List<EventContact> eventContacts;

  Events({
    this.eventId,
    this.eventName,
    this.eventLocation,
    this.eventLatLong,
    this.eventTicketPrice,
    this.eventDate,
    this.eventPoster,
    this.eventDescription,
    this.eventMedia,
    this.eventContacts,
  });

  Events.fromJson(DocumentSnapshot json) {
    eventId = json.data["eventId"];
    eventName = json.data["eventName"];
    eventLocation = json.data["eventLocation"];
    eventLatLong = json.data["eventLatLong"] == null
        ? EventLatLong()
        : EventLatLong.fromJson(json.data["eventLatLong"]);
    eventTicketPrice = json.data["eventTicketPrice"];
    eventDate = json.data["eventDate"];
    eventPoster = json.data["eventPoster"];
    eventDescription = json.data["eventDescription"];
    eventMedia = new List<EventMedia>.from(json["eventMedia"].map);
    eventContacts = new List<EventContact>.from(
        json["eventContacts"].map((x) => EventContact.fromJson(x)));
  }

  /*factory Events.fromJson(Map<String, dynamic> json) => new Events(
        eventId: json["eventId"],
        eventName: json["eventName"],
        eventLocation: json["eventLocation"],
        eventLatLong: json["eventLatLong"] == null
            ? EventLatLong()
            : EventLatLong.fromJson(json["eventLatLong"]),
        eventTicketPrice: json["eventTicketPrice"],
        eventDate: json["eventDate"],
        eventPoster: json["eventPoster"],
        eventDescription: json["eventDescription"],
        eventMedia: new List<EventMedia>.from(
            json["eventMedia"].map((x) => EventMedia.fromJson(x))),
        eventContacts: new List<EventContact>.from(
            json["eventContacts"].map((x) => EventContact.fromJson(x))),
      );*/

  Map<String, dynamic> toJson() => {
        "eventId": eventId,
        "eventName": eventName,
        "eventLocation": eventLocation,
        "eventLatLong": eventLatLong.toJson(),
        "eventTicketPrice": eventTicketPrice,
        "eventDate": eventDate,
        "eventPoster": eventPoster,
        "eventDescription": eventDescription,
        "eventMedia": new List<dynamic>.from(eventMedia.map((x) => x.toJson())),
        "eventContacts":
            new List<dynamic>.from(eventContacts.map((x) => x.toJson())),
      };
}

class EventContact {
  int contactId;
  String contactName;
  String contactDetail;

  EventContact({
    this.contactId,
    this.contactName,
    this.contactDetail,
  });

  factory EventContact.fromJson(Map<String, dynamic> json) => new EventContact(
        contactId: json["contactId"],
        contactName: json["contactName"],
        contactDetail: json["contactDetail"],
      );

  Map<String, dynamic> toJson() => {
        "contactId": contactId,
        "contactName": contactName,
        "contactDetail": contactDetail,
      };
}

class EventLatLong {
  GeoPointValue geoPointValue;

  EventLatLong({
    this.geoPointValue,
  });

  factory EventLatLong.fromJson(Map<String, dynamic> json) => new EventLatLong(
        geoPointValue: GeoPointValue.fromJson(json["geoPointValue"]),
      );

  Map<String, dynamic> toJson() => {
        "geoPointValue": geoPointValue.toJson(),
      };
}

class GeoPointValue {
  double latitude;
  double longitude;

  GeoPointValue({
    this.latitude,
    this.longitude,
  });

  factory GeoPointValue.fromJson(Map<String, dynamic> json) =>
      new GeoPointValue(
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

class EventMedia {
  int mediaId;
  String mediaUrl;

  EventMedia({
    this.mediaId,
    this.mediaUrl,
  });

  /*EventMedia.fromJson(DocumentSnapshot json) {
    mediaId = json["mediaId"];
    mediaUrl = json["mediaUrl"];
  }*/

  factory EventMedia.fromJson(Map<String, dynamic> json) =>
      new EventMedia(mediaId: json["mediaId"], mediaUrl: json["mediaUrl"]);

  Map<String, dynamic> toJson() => {
        "mediaId": mediaId,
        "mediaUrl": mediaUrl,
      };
}
