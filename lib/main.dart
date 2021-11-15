import 'package:flutter/material.dart';
import 'package:github_challenge/zarinpal_challenge.dart';
import 'package:injectable/injectable.dart';

import 'injection_container/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureInjection(Environment.prod);

  runApp(ZarinPalChallenge());
}