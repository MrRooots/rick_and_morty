import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/feature/domain/entities/location_entity.dart';

class CharacterEntity extends Equatable {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final LocationEntity origin;
  final LocationEntity location;
  final String image;
  final List<String> episodes;
  final DateTime created;

  const CharacterEntity({
    required final this.id,
    required final this.name,
    required final this.status,
    required final this.species,
    required final this.type,
    required final this.gender,
    required final this.origin,
    required final this.location,
    required final this.image,
    required final this.episodes,
    required final this.created,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        status,
        species,
        type,
        gender,
        origin,
        location,
        image,
        episodes,
        created,
      ];
}
