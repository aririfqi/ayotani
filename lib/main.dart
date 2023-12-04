import 'package:ayotani/presentation/pages/common_pages/cooming_soon_page.dart';
import 'package:ayotani/presentation/pages/common_pages/webview_page.dart';
import 'package:ayotani/presentation/pages/profile_pages/tentang_aplikasi_page.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
//import 'package:yess_nutrition/presentation/pages/tani_pedia/cobain.dart';
//import 'package:yess_nutrition/presentation/pages/tani_pedia/detail_pedia_page.dart';
//import 'package:yess_nutrition/presentation/pages/tani_pedia/pedia_list_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:yess_nutrition/presentation/pages/tani_pedia/search_page.dart';
import 'common/styles/styles.dart';
import 'common/utils/http_ssl_pinning.dart';
import 'common/utils/keys.dart';
import 'common/utils/routes.dart';
import 'domain/entities/entities.dart';
import 'firebase_options.dart';
import 'injection.dart' as di;
import 'presentation/pages/pages.dart';
import 'presentation/providers/providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Prevent landscape orientation
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Change status bar and navigation color
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: primaryBackgroundColor,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  // Initialize firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Pass all uncaught errors from the framework to Crashlytics.
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  // Initialize ssl pinning
  await HttpSslPinning.init();

  // Initialize service locator
  di.init();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;
  const MyApp({Key? key, required this.prefs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider(
          create: (_) => di.locator<GetUserNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<UserAuthNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<UserDataNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<UserStorageNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => BottomNavbarNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => PasswordFieldNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => WebViewNotifier(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ayo Tani',
        theme: ThemeData(
          fontFamily: 'Plus Jakarta Sans',
          colorScheme: colorScheme,
          textTheme: textTheme,
          dividerColor: dividerColor,
          scaffoldBackgroundColor: scaffoldBackgroundColor,
          inputDecorationTheme: inputDecorationTheme,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: elevatedButtonStyle,
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: outlinedButtonStyle,
          ),
          textButtonTheme: TextButtonThemeData(
            style: textButtonStyle,
          ),
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: FadeUpwardsPageTransitionsBuilder()
            },
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        navigatorKey: navigatorKey,
        scaffoldMessengerKey: scaffoldMessengerKey,
        navigatorObservers: [routeObserver],
        home: const Wrapper(),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case loginRoute:
              return MaterialPageRoute(
                builder: (_) => LoginPage(),
              );
            case registerRoute:
              return MaterialPageRoute(
                builder: (_) => RegisterPage(),
              );
            case forgotPasswordRoute:
              final email = settings.arguments as String?;

              return MaterialPageRoute(
                builder: (_) => ForgotPasswordPage(email: email),
              );
            case webviewRoute:
              final url = settings.arguments as String;

              return MaterialPageRoute(
                builder: (_) => WebViewPage(url: url),
                settings: settings,
              );
            case additionalInfoRoute:
              final user = settings.arguments as UserEntity;

              return MaterialPageRoute(
                builder: (_) => AdditionalInfoPage(user: user),
                settings: settings,
              );

            case mainRoute:
              final user = settings.arguments as UserEntity;

              return MaterialPageRoute(
                builder: (_) => MainPage(user: user),
                settings: settings,
              );

            case profileRoute:
              return MaterialPageRoute(
                builder: (_) => const ProfilePage(),
                settings: settings,
              );
            case updateProfileRoute:
              final userData = settings.arguments as UserDataEntity;

              return MaterialPageRoute(
                builder: (_) => UpdateProfilePage(userData: userData),
                settings: settings,
              );

            case listTaniPedia:
              return MaterialPageRoute(
                builder: (_) => const TaniPediaListPage(),
                settings: settings,
              );

            case coomingSoonPage:
              return MaterialPageRoute(
                builder: (_) => const CoomingSoonPage(),
                settings: settings,
              );
            case privacyPolicy:
              return MaterialPageRoute(
                builder: (_) => const KebijakanPrivasiPage(),
                settings: settings,
              );

            default:
              return null;
          }
        },
      ),
    );
  }
}
