import 'package:rick_and_morty/feature/data/models/location_model.dart';
import 'package:rick_and_morty/feature/domain/entities/character_entity.dart';

class CharacterModel extends CharacterEntity {
  const CharacterModel({
    required final int id,
    required final String name,
    required final String status,
    required final String species,
    required final String type,
    required final String gender,
    required final LocationModel origin,
    required final LocationModel location,
    required final String image,
    required final List<String> episodes,
    required final DateTime created,
  }) : super(
          id: id,
          name: name,
          status: status,
          species: species,
          type: type,
          gender: gender,
          origin: origin,
          location: location,
          image: image,
          episodes: episodes,
          created: created,
        );

  factory CharacterModel.fromJson({required final Map<String, dynamic> json}) =>
      CharacterModel(
        id: json['id'],
        name: json['name'],
        status: json['status'],
        species: json['species'],
        type: json['type'],
        gender: json['gender'],
        origin: LocationModel.fromJson(json: json['origin']),
        location: LocationModel.fromJson(json: json['location']),
        image: json['image'],
        episodes: (json['episode'] as List).map((e) => e as String).toList(),
        created: DateTime.parse(json['created'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'status': status,
        'species': species,
        'type': type,
        'gender': gender,
        'origin': (origin as LocationModel).toJson(),
        'location': (location as LocationModel).toJson(),
        'image': image,
        'episode': episodes,
        'created': created.toIso8601String(),
      };
}
