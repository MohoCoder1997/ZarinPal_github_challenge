import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';

@Injectable()
class UrlLuncher {
  Future<bool> canLunchUrl({required String url}) async {
    try {
      return await canLaunch(url);
    } catch (e) {
      return false;
    }
  }

  Future<Either<UrlLuncherException, bool>> openLink(
      {required String url}) async {
    try {
      final _result = await launch(url);
      return Right(_result);
    } catch (e) {
      return Left(UrlLuncherException(e.toString()));
    }
  }
}

class UrlLuncherException {
  final String massege;
  const UrlLuncherException(this.massege);
}
