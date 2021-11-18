import 'package:dartz/dartz.dart';
import 'package:github_challenge/domain/core/failure_response.dart';
import 'package:github_challenge/domain/entities/access_token.dart';
import 'package:github_challenge/domain/entities/login_device.dart';
import 'package:github_challenge/domain/entities/repo.dart';
import 'package:github_challenge/domain/entities/user.dart';

abstract class IRepository {
  Future<Either<HttpFail, User>> getUserInfo();
  Future<Either<HttpFail, List<Repo>>> getRepoInfo(
      {required bool isNewLoad});
  Future<Either<HttpFail, LoginDevice>> loginDevice();
  Future<Either<HttpFail, AccessToken>> getAccessToken();
}
