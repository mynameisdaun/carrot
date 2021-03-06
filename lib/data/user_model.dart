import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

class UserModel {
  late String userKey;
  late String phoneNumber;
  late String address;
  late num lat;
  late num lon;
  late GeoFirePoint geoFirePoint;
  late DateTime createdDate;
  DocumentReference? reference;

  UserModel.fromJson(Map<String, dynamic> json) {
    userKey = json['userKey'];
    phoneNumber = json['phoneNumber'];
    address = json['address'];
    lat = json['lat'];
    lon = json['lon'];
    geoFirePoint = GeoFirePoint(
        (json['geoFirePoint']['geopoint']).latitude,
        (json['geoFirePoint']['geopoint']).longitude
    );
    createdDate = json['createdDate'] == null
        ? DateTime.now().toUtc()
        : (json['createdDate'] as Timestamp).toDate();
    reference = json['reference'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phoneNumber'] = phoneNumber;
    map['address'] = address;
    map['lat'] = lat;
    map['lon'] = lon;
    map['geoFirePoint'] = geoFirePoint.data;
    map['createdDate'] = createdDate;
    return map;
  }

}