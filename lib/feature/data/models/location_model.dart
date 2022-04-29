import 'package:rick_and_morty/feature/domain/entities/location_entity.dart';

class LocationModel extends LocationEntity {
  const LocationModel({
    required final String name,
    required final String url,
  }) : super(name: name, url: url);

  factory LocationModel.fromJson({required final Map<String, dynamic> json}) =>
      LocationModel(name: json['name'], url: json['url']);

  Map<String, dynamic> toJson() => {'name': name, 'url': url};
}
