import 'package:equatable/equatable.dart';

class LocationEntity extends Equatable {
  final String name;
  final String url;

  const LocationEntity({required final this.name, required final this.url});

  @override
  List<Object?> get props => [name, url];
}
