// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import 'package:ayotani/common/styles/color_scheme.dart';
import 'package:ayotani/common/utils/enum_state.dart';
import 'package:ayotani/common/utils/keys.dart';
import 'package:ayotani/common/utils/routes.dart';
import 'package:ayotani/common/utils/utilities.dart';
import 'package:ayotani/presentation/providers/common_notifiers/password_field_notifier.dart';
import 'package:ayotani/presentation/providers/user_notifiers/user_auth_notifiers/user_auth_notifier.dart';
import 'package:ayotani/presentation/providers/user_notifiers/user_firestore_notifiers/user_data_notifier.dart';
import 'package:ayotani/presentation/widgets/clickable_text.dart';
import 'package:ayotani/presentation/widgets/loading_indicator.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: <Widget>[
                SvgPicture.asset(
                  'assets/svg/wave_background.svg',
                  alignment: Alignment.topCenter,
                  width: width,
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child:
                        SvgPicture.asset('assets/svg/ayotani-logo-white1.png'),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.headlineMedium,
                      children: const <TextSpan>[
                        TextSpan(
                          text: 'Selamat Datang di ',
                          style: TextStyle(color: primaryTextColor),
                        ),
                        TextSpan(
                          text: 'AyoTani!',
                          style: TextStyle(color: primaryColor),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Masukkan akunmu terlebih dahulu ya.',
                    style: TextStyle(color: secondaryTextColor),
                  ),
                  const SizedBox(height: 24),
                  FormBuilder(
                    key: _formKey,
                    //autoFocusOnValidationFailure: true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        _buildEmailField(),
                        const SizedBox(height: 20),
                        _buildPasswordField(),
                        const SizedBox(height: 8),
                        ClickableText(
                          onTap: () {
                            Navigator.pushNamed(context, forgotPasswordRoute);
                          },
                          text: 'Lupa Password?',
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildSubmitButton(context),
                  const SizedBox(height: 16),
                  // _buildGoogleSignInButton(context),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('Belum punya akun? '),
                      ClickableText(
                        onTap: () {
                          Navigator.pushNamed(context, registerRoute);
                        },
                        text: 'Daftar di sini.',
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  FormBuilderTextField _buildEmailField() {
    return FormBuilderTextField(
      name: 'email',
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'Email',
        hintText: 'Masukkan email kamu',
        prefixIcon: Icon(Icons.email_outlined),
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: 'Bagian ini harus diisi.'),
        FormBuilderValidators.email(errorText: 'Email tidak valid.'),
      ]),
    );
  }

  Consumer<PasswordFieldNotifier> _buildPasswordField() {
    return Consumer<PasswordFieldNotifier>(
      builder: (context, provider, child) {
        final isVisible = provider.isSignInPasswordVisible;

        return FormBuilderTextField(
          name: 'password',
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.visiblePassword,
          obscureText: !isVisible,
          decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'Masukkan password kamu',
            prefixIcon: const Icon(Icons.lock_outline_rounded),
            suffixIcon: IconButton(
              icon: isVisible
                  ? const Icon(Icons.visibility_outlined)
                  : const Icon(Icons.visibility_off_outlined),
              onPressed: () => provider.isSignInPasswordVisible = !isVisible,
            ),
          ),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
              errorText: 'Bagian ini harus diisi.',
            ),
          ]),
        );
      },
    );
  }

  SizedBox _buildSubmitButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => _onPressedSubmitButton(context),
        child: const Text('Masuk'),
      ),
    );
  }

  SizedBox _buildGoogleSignInButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: () => _onPressedGoogleSignInButton(context),
        icon: const FaIcon(
          FontAwesomeIcons.google,
          size: 18,
        ),
        label: const Text('Lanjutkan dengan Google'),
      ),
    );
  }

  Future<void> _onPressedSubmitButton(BuildContext context) async {
    FocusScope.of(context).unfocus();

    _formKey.currentState!.save();

    if (_formKey.currentState!.validate()) {
      final value = _formKey.currentState!.value;
      final authNotifier = context.read<UserAuthNotifier>();

      // show loading when sign in is currently on process
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const LoadingIndicator(),
      );

      // sign in process
      await authNotifier.signIn(value['email'], value['password']);

      if (authNotifier.state == UserState.success) {
        // get user
        final user = authNotifier.user;

        // close the loading indicator
        navigatorKey.currentState!.pop();

        // navigate to main page
        navigatorKey.currentState!.pushReplacementNamed(
          mainRoute,
          arguments: user,
        );
      } else {
        final snackBar = Utilities.createSnackBar(authNotifier.error);

        // close the loading indicator
        navigatorKey.currentState!.pop();

        scaffoldMessengerKey.currentState!
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
      }
    }
  }

  Future<void> _onPressedGoogleSignInButton(BuildContext context) async {
    final authNotifier = context.read<UserAuthNotifier>();
    final userDataNotifier = context.read<UserDataNotifier>();

    await authNotifier.signInWithGoogle();

    if (authNotifier.state == UserState.error) {
      final snackBar = Utilities.createSnackBar(authNotifier.error);

      scaffoldMessengerKey.currentState!
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }

    // get user
    final user = authNotifier.userFromGoogle;

    if (user != null) {
      // first, check if this user already in database
      await userDataNotifier.getUserStatus(user.uid);

      if (userDataNotifier.state == UserState.success) {
        if (userDataNotifier.isNewUser) {
          // convert user entity to user data entity
          final userData = user.toUserData();

          // craete user data
          await userDataNotifier.createUserData(userData);

          if (userDataNotifier.state == UserState.success) {
            // navigate to main page
            navigatorKey.currentState!.pushReplacementNamed(
              mainRoute,
              arguments: user,
            );
          }
        } else {
          // navigate to main page
          navigatorKey.currentState!.pushReplacementNamed(
            mainRoute,
            arguments: user,
          );
        }
      }
    }
  }
}
