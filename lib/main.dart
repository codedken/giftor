import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import './providers/group_provider.dart';
import './providers/auth_provider.dart';
import './models/group/group.dart';
import './models/my_shared_preferences.dart';
import './screens/screens.dart';
import './constants_and_methods.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await MySharedPreferences.init();
  kShowBottomStatusBar;
  runApp(Giftor());
}

class Giftor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => AuthProvider(),
        ),
        ChangeNotifierProxyProvider<AuthProvider, GroupProvider>(
          create: (ctx) => GroupProvider(),
          update: (ctx, auth, group) => group!..setAuth(auth),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue,
          ).copyWith(
            secondary: Colors.red,
          ),
          fontFamily: GoogleFonts.kodchasan().fontFamily,
        ),
        home: MySharedPreferences.exists(MySharedPreferences.userData)
            ? HomeScreen()
            : AuthScreen(),
        onGenerateRoute: (RouteSettings page) {
          switch (page.name) {
            case AuthScreen.routeName:
              return pageTransitionWidget(AuthScreen());
            case HomeScreen.routeName:
              return pageTransitionWidget(HomeScreen());
            case LoginScreen.routeName:
              return pageTransitionWidget(LoginScreen());
            case SettingsScreen.routeName:
              return pageTransitionWidget(SettingsScreen());
            case ParticipantsScreen.routeName:
              final arg = page.arguments as Group;
              return pageTransitionWidget(ParticipantsScreen(
                group: arg,
              ));
            case PickRecipientScreen.routeName:
              final arg = page.arguments as String;
              return pageTransitionWidget(PickRecipientScreen(arg));
            case RegisterScreen.routeName:
              return pageTransitionWidget(RegisterScreen());
            case ResetPasswordScreen.routeName:
              return pageTransitionWidget(ResetPasswordScreen());
            default:
              return pageTransitionWidget(AuthScreen());
          }
        },
      ),
    );
  }
}
