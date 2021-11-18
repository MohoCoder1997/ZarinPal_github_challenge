import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class NavigationHandler {
  static Future<T?> goToPage<T extends Object?>(BuildContext context,
      {required Widget page}) {
    return Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => page));
  }
}
