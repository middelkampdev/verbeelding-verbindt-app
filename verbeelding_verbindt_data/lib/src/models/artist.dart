import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../verbeelding_verbindt_data.dart';

part 'artist.g.dart';

@JsonSerializable()
class ArtistDataModel extends Equatable {
  const ArtistDataModel({
    required this.id,
    required this.profile,
    required this.specialities,
    required this.location,
    required this.previewContent,
    required this.detailsContent,
    required this.website,
  });

  final String? id;
  final ProfileDataModel profile;
  final Map<String, SpecialityDataModel> specialities;
  final GeolocationDataModel location;
  final ArtistRoutePreviewDataModel previewContent;
  final ArtistRouteDetailsDataModel detailsContent;
  final String website;

  @override
  List<Object?> get props => [
        id,
        profile,
        specialities,
        location,
        previewContent,
        detailsContent,
        website,
      ];

  @override
  bool? get stringify => true;

  ArtistDataModel copyWith({
    String? id,
    ProfileDataModel? profile,
    List<String>? specialities,
    GeolocationDataModel? location,
    ArtistRoutePreviewDataModel? previewContent,
    ArtistRouteDetailsDataModel? detailsContent,
    String? website,
  }) {
    return ArtistDataModel(
      id: id ?? this.id,
      profile: profile ?? this.profile,
      specialities: specialities as Map<String, SpecialityDataModel>? ??
          this.specialities,
      location: location ?? this.location,
      previewContent: previewContent ?? this.previewContent,
      detailsContent: detailsContent ?? this.detailsContent,
      website: website ?? this.website,
    );
  }

  static ArtistDataModel fromJson(Map<String, dynamic> json) =>
      _$ArtistDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$ArtistDataModelToJson(this);
}
