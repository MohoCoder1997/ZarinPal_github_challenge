import 'package:equatable/equatable.dart';
import 'package:github_challenge/domain/core/date_time_convertor.dart';
import 'package:json_annotation/json_annotation.dart';

class User extends Equatable {
  @JsonKey(name: 'login')
  final String usreName;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'avatar_url')
  final String? imgUrl;
  @JsonKey(name: 'company')
  final String? company;
  @JsonKey(name: 'location')
  final String? location;
  @JsonKey(name: 'bio')
  final String? bio;
  @JsonKey(name: 'twitter_username')
  final String? twitterUsername;
  @JsonKey(name: 'followers')
  final int followers;
  @JsonKey(name: 'following') 
  final int following;
  @JsonKey(name: 'created_at' , toJson: dateTimetojson , fromJson: dateTimeFromJson)
  final DateTime? createdAt;

  User({
    required this.usreName,
    required this.name,
    required this.imgUrl,
    required this.company,
    required this.location,
    required this.bio,
    required this.twitterUsername,
    required this.followers,
    required this.following,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        usreName,
        name,
        imgUrl,
        company,
        location,
        bio,
        twitterUsername,
        followers,
        following,
        createdAt,
      ];
}
