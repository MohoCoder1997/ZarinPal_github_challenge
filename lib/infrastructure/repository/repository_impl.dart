import 'package:github_challenge/domain/entities/repo.dart';
import 'package:github_challenge/domain/entities/user.dart';
import 'package:github_challenge/domain/core/failure_response.dart';
import 'package:dartz/dartz.dart';
import 'package:github_challenge/domain/repository/i_repository.dart';
import 'package:github_challenge/infrastructure/core/connection_checker.dart';
import 'package:github_challenge/infrastructure/datasources/remote_data_source.dart';
import 'package:injectable/injectable.dart';


@Singleton(as: IRepository) 
class RepositoryImpl extends IRepository {
  final RemoteDataSource _remoteDataSource;
  final ConnectionChecker _conectionChecker;

  RepositoryImpl(
    this._remoteDataSource,
    this._conectionChecker,   
  );
  @override
  Future<Either<HttpFail, User>> getUserInfo({required String userName}) async {
    if (await _conectionChecker.isConnected) {
      try {
        return Right(await _remoteDataSource.getUserInfo(userName: userName));
      } on HttpFail catch (e) {
        return Left(e);
      }
    } else {
      return Left(NoConectionFail(message: 'NoConnection ...'));
    }
  }

  @override
  Future<Either<HttpFail, List<Repo>>> getRepoInfo({required String userName}) async{
    if (await _conectionChecker.isConnected) {
      try {
        return Right(await _remoteDataSource.getRepoInfo(userName: userName));
      } on HttpFail catch (e) {
        return Left(e);
      }
    } else {
      return Left(NoConectionFail(message: 'NoConnection ...'));
    }
  }
}
