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
  GeoPoint eventLatLong;
  int eventTicketPrice;
  DateTime eventDate;
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

  factory Events.fromJson(Map<String, dynamic> json) => new Events(
        eventId: json["eventId"],
        eventName: json["eventName"],
        eventLocation: json["eventLocation"],
        eventLatLong: json["eventLatLong"] == null
            ? GeoPoint(0, 0)
            : json['eventLatLong'],
        eventTicketPrice: json["eventTicketPrice"],
        eventDate: json["eventDate"],
        eventPoster: json["eventPoster"],
        eventDescription: json["eventDescription"],
        eventMedia: json["eventMedia"] != null
            ? new List<EventMedia>.from(
                json["eventMedia"].map((x) => EventMedia.fromJson(x)))
            : null,
        eventContacts: json["eventContacts"] != null
            ? new List<EventContact>.from(
                json["eventContacts"].map((x) => EventContact.fromJson(x)))
            : null,
      );

  Map<dynamic, dynamic> toJson() => {
        "eventId": eventId,
        "eventName": eventName,
        "eventLocation": eventLocation,
        "eventLatLong": eventLatLong,
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

  factory EventContact.fromJson(Map<dynamic, dynamic> json) => new EventContact(
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

class EventMedia {
  int mediaId;
  String mediaUrl;

  EventMedia({
    this.mediaId,
    this.mediaUrl,
  });

  factory EventMedia.fromJson(Map<dynamic, dynamic> json) =>
      new EventMedia(mediaId: json["mediaId"], mediaUrl: json["mediaUrl"]);

  Map<String, dynamic> toJson() => {
        "mediaId": mediaId,
        "mediaUrl": mediaUrl,
      };
}
