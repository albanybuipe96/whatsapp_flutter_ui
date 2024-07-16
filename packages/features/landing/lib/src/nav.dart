import 'package:flutter/material.dart';
import 'package:nav/nav.dart';

abstract class Nav implements Routes {
  // static void toLogin(BuildContext context) =>
  //     Navigator.of(context).pushNamed(Routes.login);
  //
  // static void offToLogin(BuildContext context) =>
  //     Navigator.of(context).pushNamedAndRemoveUntil(
  //       Routes.login,
  //       (route) => !Navigator.canPop(context),
  //     );

  static void toError(BuildContext context) =>
      Navigator.of(context).pushNamed('routeName');
}
