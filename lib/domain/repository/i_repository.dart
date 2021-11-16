import 'package:dartz/dartz.dart';
import 'package:github_challenge/domain/core/failure_response.dart';
import 'package:github_challenge/domain/entities/user.dart';

abstract class IRepository {
  Future<Either<HttpFail, User>> getUserInfo({required String userName});
}