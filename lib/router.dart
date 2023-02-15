import 'package:flutter/material.dart';
import 'package:whatsapp_ui/common/widgets/error.dart';
import 'package:whatsapp_ui/features/auth/screen/login_screen.dart';
import 'package:whatsapp_ui/features/auth/screen/otp_screen.dart';
import 'package:whatsapp_ui/screens/mobile_chat_screen.dart';
import 'features/auth/screen/user_information_screen.dart';
import 'features/select_contacts/screens/select_contacts_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );
    case OTPScreen.routeName:
      final verificationId = settings.arguments as String;
      return MaterialPageRoute(
        builder: (context) => OTPScreen(
          verificationId: verificationId,
        ),
      );
    case UserInformationScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const UserInformationScreen(),
      );
    case SelectContactsScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const SelectContactsScreen(),
      );
    case MobileChatScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const MobileChatScreen(),
      );
    //  case MobileChatScreen.routeName:
    // final arguments = settings.arguments as Map<String, dynamic>;
    // final name = arguments['name'];
    // final uid = arguments['uid'];
    // final isGroupChat = arguments['isGroupChat'];
    // final profilePic = arguments['profilePic'];
    // return MaterialPageRoute(
    //   builder: (context) => MobileChatScreen(
    //     name: name,
    //     uid: uid,
    //     isGroupChat: isGroupChat,
    //     profilePic: profilePic,
    //   ),
    // );

    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: ErrorScreen(error: 'This page doesn\'t exist'),
        ),
      );
  }
}
