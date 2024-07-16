import 'package:flutter/cupertino.dart';

class Routes {
  Routes(this.context);

  final BuildContext context;
  final String _login = '/login-screen';
  final String _landing = '/landing-screen';
  final String _otp = '/otp-screen';
  final String _userInfo = '/user-info-screen';
  final String _chat = '/chat-screen';
  final String _chatList = '/chat-list-screen';
  final String _contactList = '/contact-list-screen';

  void toLogin() => Navigator.of(context).pushNamed(_login);

  void popUntilLogin() => Navigator.of(context)
      .pushNamedAndRemoveUntil(_login, (route) => !Navigator.canPop(context));

  void toLanding() => Navigator.of(context).pushNamed(_landing);

  void toOtp(String id) => Navigator.of(context).pushNamed(_otp, arguments: id);

  void toUserInfo() => Navigator.of(context).pushNamedAndRemoveUntil(
      _userInfo, (route) => !Navigator.canPop(context));

  void toChatScreen() => Navigator.of(context).pushNamed(_chat);

  void popUntilChatScreen() => Navigator.of(context)
      .pushNamedAndRemoveUntil(_chat, (route) => !Navigator.canPop(context));

  void toChatList() => Navigator.of(context).pushNamed(_chatList);

  void popUntilChatList() => Navigator.of(context).pushNamedAndRemoveUntil(
      _chatList, (route) => !Navigator.canPop(context));

  void toContactList() => Navigator.of(context).pushNamed(_chatList);

  void popUntilContactList() => Navigator.of(context).pushNamedAndRemoveUntil(
      _contactList, (route) => !Navigator.canPop(context));
}
