import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:github_challenge/presentation/core/localization/app_localizations.dart';
import 'package:github_challenge/presentation/core/localization/lang/lang_keys.dart';

class LoadFailureView extends StatelessWidget {
  const LoadFailureView({
    Key? key,
    required this.message,
    required this.onTapTryAgain,
  }) : super(key: key);
  final String message;
  final Function()? onTapTryAgain;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                    text: message,
                    style: Theme.of(context).textTheme.subtitle1),
                TextSpan(
                  text: AppLocalizations.of(context)!.translate(LangKeys.TRY_AGAIN),
                  style: Theme.of(context).textTheme.headline3,
                  recognizer: TapGestureRecognizer()..onTap = onTapTryAgain,
                )
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
