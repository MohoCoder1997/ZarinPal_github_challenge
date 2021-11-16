import 'package:github_challenge/domain/core/date_time_convertor.dart';
import 'package:github_challenge/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto extends User {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'node_id')
  final String nodeId;
  @JsonKey(name: 'gravatar_id')
  final String? gravatarId;
  @JsonKey(name: 'url')
  final String? url;
  @JsonKey(name: 'html_url')
  final String? htmlUrl;
  @JsonKey(name: 'followers_url')
  final String ?followersUrl;
  @JsonKey(name: 'following_url')
  final String? followingUrl;
  @JsonKey(name: 'gists_url')
  final String? gistsUrl;
  @JsonKey(name: 'starred_url')
  final String? starredUrl;
  @JsonKey(name: 'subscriptions_url')
  final String? subscriptionsUrl;
  @JsonKey(name: 'organizations_url')
  final String? organizationsUrl;
  @JsonKey(name: 'repos_url')
  final String? reposUrl;
  @JsonKey(name: 'events_url')
  final String? eventsUrl;
  @JsonKey(name: 'received_events_url')
  final String? receivedEventsUrl;
  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: 'site_admin')
  final bool? siteAdmin;
  @JsonKey(name: 'blog')
  final String? blog;
  @JsonKey(name: 'email')
  final String? email;  
  @JsonKey(name: 'hireable')
  final bool? hireable;
  @JsonKey(name: 'public_repos')
  final int? publicRepos;
  @JsonKey(name: 'public_gists')
  final int? publicGists;
  @JsonKey(name: 'updated_at' , toJson: dateTimetojson , fromJson: dateTimeFromJson)
  final DateTime? updatedAt;

  UserDto(
    this.id,
    this.nodeId,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
    this.siteAdmin,
    this.blog,
    this.email,
    this.hireable,
    this.publicRepos,
    this.publicGists,
    this.updatedAt, {
    required String usreName,
    required String? name,
    required String? imgUrl,
    required String? company,
    required String? location,
    required String? bio,
    required String? twitterUsername,
    required int followers,
    required int following,
    required DateTime? createdAt,
  }) : super(
          usreName: usreName,
          name: name,
          imgUrl: imgUrl,
          company: company,
          location: location,
          bio: bio,
          twitterUsername: twitterUsername,
          followers: followers,
          following: following,
          createdAt: createdAt,
        );

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
