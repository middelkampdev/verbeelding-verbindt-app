import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable()
class LocationModel extends Equatable {
  const LocationModel({
    required this.latitude,
    required this.longitude,
  });

  factory LocationModel.fromMap(
    Map<String, dynamic> map,
  ) {
    return LocationModel(
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }

  factory LocationModel.fromGeoPoint(
    GeoPoint geoPoint,
  ) {
    return LocationModel(
      latitude: geoPoint.latitude,
      longitude: geoPoint.longitude,
    );
  }

  factory LocationModel.fromDynamic(
    dynamic object,
  ) {
    if (object is Map) {
      return LocationModel.fromMap(object as Map<String, dynamic>);
    } else if (object is GeoPoint) {
      return LocationModel.fromGeoPoint(object);
    }
    throw Exception(
        'Unsupported source object type provided ${object.runtimeType}');
  }

  final double latitude;
  final double longitude;

  @override
  String toString() =>
      '$runtimeType { latitude: $latitude, longitude: $longitude }';

  String toUrlParam() => '$latitude,$longitude';

  @override
  List<Object> get props => [latitude, longitude];

  static LocationModel fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}