import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ayotani/domain/entities/user_entity.dart';
import 'package:ayotani/presentation/pages/auth_pages/login_page.dart';
import 'package:ayotani/presentation/pages/common_pages/main_page.dart';
import 'package:ayotani/presentation/providers/user_notifiers/user_auth_notifiers/get_user_notifier.dart';
import 'package:ayotani/presentation/widgets/loading_indicator.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userNotifier = context.watch<GetUserNotifier>();

    return StreamBuilder<UserEntity?>(
      stream: userNotifier.user,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final UserEntity? user = snapshot.data;

          return user == null ? LoginPage() : MainPage(user: user);
        } else {
          return const Scaffold(body: LoadingIndicator());
        }
      },
    );
  }
}
