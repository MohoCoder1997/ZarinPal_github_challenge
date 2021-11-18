import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class Repo extends Equatable {
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'language')
  final String? language;
  @JsonKey(name: 'forks_count')
  final int? forksCount;
  @JsonKey(name: 'topics')
  final List<String> topics;
  @JsonKey(name: 'visibility')
  final String visibility;
  @JsonKey(name: 'watchers')
  final int? watchers;

  Repo({
    required this.name,
    required this.description,
    required this.language,
    required this.forksCount,
    required this.topics,
    required this.visibility,
    required this.watchers,
  });

  @override
  List<Object?> get props => [
        name,
        description,
        language,
        forksCount,
        topics,
        visibility,
        watchers,
      ];
}
