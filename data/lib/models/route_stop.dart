import 'package:json_annotation/json_annotation.dart';

import 'artist.dart';

part 'route_stop.g.dart';

// Settings a default value build.yaml didn't work - 30-04-2020
@JsonSerializable(explicitToJson: true)
class RouteStopDataModel {
  const RouteStopDataModel({
    required this.artist,
    this.completed = false,
  });

  final ArtistDataModel artist;
  final bool completed;

  RouteStopDataModel copyWith({
    ArtistDataModel? artist,
    bool? completed,
  }) {
    return RouteStopDataModel(
      artist: artist ?? this.artist,
      completed: completed ?? this.completed,
    );
  }

  static RouteStopDataModel fromMap(
    Map<String, dynamic> map,
  ) {
    return RouteStopDataModel(
      artist: ArtistDataModel.fromMap(
        id: map['artistId'],
        map: map['artist'],
      ),
      completed: map['completed'],
    );
  }

  static RouteStopDataModel fromJson(Map<String, dynamic> json) =>
      _$RouteStopDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$RouteStopDataModelToJson(this);
}