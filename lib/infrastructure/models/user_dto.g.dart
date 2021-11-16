// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) {
  return UserDto(
    json['id'] as int,
    json['node_id'] as String,
    json['gravatar_id'] as String?,
    json['url'] as String?,
    json['html_url'] as String?,
    json['followers_url'] as String?,
    json['following_url'] as String?,
    json['gists_url'] as String?,
    json['starred_url'] as String?,
    json['subscriptions_url'] as String?,
    json['organizations_url'] as String?,
    json['repos_url'] as String?,
    json['events_url'] as String?,
    json['received_events_url'] as String?,
    json['type'] as String?,
    json['site_admin'] as bool?,
    json['blog'] as String?,
    json['email'] as String?,
    json['hireable'] as bool?,
    json['public_repos'] as int?,
    json['public_gists'] as int?,
    dateTimeFromJson(json['updated_at'] as String?),
    usreName: json['login'] as String,
    name: json['name'] as String?,
    imgUrl: json['avatar_url'] as String?,
    company: json['company'] as String?,
    location: json['location'] as String?,
    bio: json['bio'] as String?,
    twitterUsername: json['twitter_username'] as String?,
    followers: json['followers'] as int,
    following: json['following'] as int,
    createdAt: dateTimeFromJson(json['created_at'] as String?),
  );
}

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      'login': instance.usreName,
      'name': instance.name,
      'avatar_url': instance.imgUrl,
      'company': instance.company,
      'location': instance.location,
      'bio': instance.bio,
      'twitter_username': instance.twitterUsername,
      'followers': instance.followers,
      'following': instance.following,
      'created_at': dateTimetojson(instance.createdAt),
      'id': instance.id,
      'node_id': instance.nodeId,
      'gravatar_id': instance.gravatarId,
      'url': instance.url,
      'html_url': instance.htmlUrl,
      'followers_url': instance.followersUrl,
      'following_url': instance.followingUrl,
      'gists_url': instance.gistsUrl,
      'starred_url': instance.starredUrl,
      'subscriptions_url': instance.subscriptionsUrl,
      'organizations_url': instance.organizationsUrl,
      'repos_url': instance.reposUrl,
      'events_url': instance.eventsUrl,
      'received_events_url': instance.receivedEventsUrl,
      'type': instance.type,
      'site_admin': instance.siteAdmin,
      'blog': instance.blog,
      'email': instance.email,
      'hireable': instance.hireable,
      'public_repos': instance.publicRepos,
      'public_gists': instance.publicGists,
      'updated_at': dateTimetojson(instance.updatedAt),
    };
