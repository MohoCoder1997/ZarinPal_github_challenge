import 'package:github_challenge/domain/core/date_time_convertor.dart';
import 'package:github_challenge/domain/entities/repo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'repo_dto.g.dart';

@JsonSerializable()
class RepoDto extends Repo {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'node_id')
  final String nodeId;
  @JsonKey(name: 'full_name')
  final String fullName;
  @JsonKey(name: 'private')
  final bool private;
  @JsonKey(name: 'html_url')
  final String? htmlUrl;
  @JsonKey(name: 'fork')
  final bool? fork;
  @JsonKey(name: 'url')
  final String? url;
  @JsonKey(name: 'forks_url')
  final String? forksUrl;
  @JsonKey(name: 'keys_url')
  final String? keysUrl;
  @JsonKey(name: 'collaborators_url')
  final String? collaboratorsUrl;
  @JsonKey(name: 'teams_url')
  final String? teamsUrl;
  @JsonKey(name: 'hooks_url')
  final String? hooksUrl;
  @JsonKey(name: 'issue_events_url')
  final String? issueEventsUrl;
  @JsonKey(name: 'events_url')
  final String? eventsUrl;
  @JsonKey(name: 'assignees_url')
  final String? assigneesUrl;
  @JsonKey(name: 'branches_url')
  final String? branchesUrl;
  @JsonKey(name: 'tags_url')
  final String? tagsUrl;
  @JsonKey(name: 'blobs_url')
  final String? blobsUrl;
  @JsonKey(name: 'git_tags_url')
  final String? gitTagsUrl;
  @JsonKey(name: 'git_refs_url')
  final String? gitRefsUrl;
  @JsonKey(name: 'trees_url')
  final String? treesUrl;
  @JsonKey(name: 'statuses_url')
  final String? statusesUrl;
  @JsonKey(name: 'languages_url')
  final String? languagesUrl;
  @JsonKey(
      name: 'created_at', toJson: dateTimetojson, fromJson: dateTimeFromJson)
  final DateTime? createdAt;
  @JsonKey(
      name: 'updated_at', toJson: dateTimetojson, fromJson: dateTimeFromJson)
  final DateTime? updatedAt;
  @JsonKey(
      name: 'pushed_at', toJson: dateTimetojson, fromJson: dateTimeFromJson)
  final DateTime? pushedAt;

  RepoDto(
    this.id,
    this.nodeId,
    this.fullName,
    this.private,
    this.htmlUrl,
    this.fork,
    this.url,
    this.forksUrl,
    this.keysUrl,
    this.collaboratorsUrl,
    this.teamsUrl,
    this.hooksUrl,
    this.issueEventsUrl,
    this.eventsUrl,
    this.assigneesUrl,
    this.branchesUrl,
    this.tagsUrl,
    this.blobsUrl,
    this.gitTagsUrl,
    this.gitRefsUrl,
    this.treesUrl,
    this.statusesUrl,
    this.languagesUrl,
    this.createdAt,
    this.updatedAt,
    this.pushedAt, {
    required String? name,
    required String? description,
    required String? language,
    required int? forksCount,
    required List<String> topics,
    required String visibility,
    required int? watchers,
  }) : super(
          name: name,
          description: description,
          language: language,
          forksCount: forksCount,
          topics: topics,
          visibility: visibility,
          watchers: watchers,
        );

  factory RepoDto.fromJson(Map<String, dynamic> json) =>
      _$RepoDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RepoDtoToJson(this);
}
