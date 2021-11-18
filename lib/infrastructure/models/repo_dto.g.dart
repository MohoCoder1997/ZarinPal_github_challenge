// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepoDto _$RepoDtoFromJson(Map<String, dynamic> json) {
  return RepoDto(
    json['id'] as int,
    json['node_id'] as String,
    json['full_name'] as String,
    json['private'] as bool,
    json['html_url'] as String?,
    json['fork'] as bool?,
    json['url'] as String?,
    json['forks_url'] as String?,
    json['keys_url'] as String?,
    json['collaborators_url'] as String?,
    json['teams_url'] as String?,
    json['hooks_url'] as String?,
    json['issue_events_url'] as String?,
    json['events_url'] as String?,
    json['assignees_url'] as String?,
    json['branches_url'] as String?,
    json['tags_url'] as String?,
    json['blobs_url'] as String?,
    json['git_tags_url'] as String?,
    json['git_refs_url'] as String?,
    json['trees_url'] as String?,
    json['statuses_url'] as String?,
    json['languages_url'] as String?,
    dateTimeFromJson(json['created_at'] as String?),
    dateTimeFromJson(json['updated_at'] as String?),
    dateTimeFromJson(json['pushed_at'] as String?),
    name: json['name'] as String?,
    description: json['description'] as String?,
    language: json['language'] as String?,
    forksCount: json['forks_count'] as int?,
    topics: (json['topics'] as List<dynamic>).map((e) => e as String).toList(),
    visibility: json['visibility'] as String,
    watchers: json['watchers'] as int?,
  );
}

Map<String, dynamic> _$RepoDtoToJson(RepoDto instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'language': instance.language,
      'forks_count': instance.forksCount,
      'topics': instance.topics,
      'visibility': instance.visibility,
      'watchers': instance.watchers,
      'id': instance.id,
      'node_id': instance.nodeId,
      'full_name': instance.fullName,
      'private': instance.private,
      'html_url': instance.htmlUrl,
      'fork': instance.fork,
      'url': instance.url,
      'forks_url': instance.forksUrl,
      'keys_url': instance.keysUrl,
      'collaborators_url': instance.collaboratorsUrl,
      'teams_url': instance.teamsUrl,
      'hooks_url': instance.hooksUrl,
      'issue_events_url': instance.issueEventsUrl,
      'events_url': instance.eventsUrl,
      'assignees_url': instance.assigneesUrl,
      'branches_url': instance.branchesUrl,
      'tags_url': instance.tagsUrl,
      'blobs_url': instance.blobsUrl,
      'git_tags_url': instance.gitTagsUrl,
      'git_refs_url': instance.gitRefsUrl,
      'trees_url': instance.treesUrl,
      'statuses_url': instance.statusesUrl,
      'languages_url': instance.languagesUrl,
      'created_at': dateTimetojson(instance.createdAt),
      'updated_at': dateTimetojson(instance.updatedAt),
      'pushed_at': dateTimetojson(instance.pushedAt),
    };
