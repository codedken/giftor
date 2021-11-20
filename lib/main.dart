import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import './providers/group_provider.dart';
import './providers/auth_provider.dart';
import './models/my_shared_preferences.dart';
import './screens/screens.dart';
import './constants_and_methods.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await MySharedPreferences.init();
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
        ChangeNotifierProvider(
          create: (ctx) => GroupProvider(),
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
          fontFamily: 'Kodchasan',
        ),
        home: AuthScreen(),
        onGenerateRoute: (RouteSettings page) {
          switch (page.name) {
            case AuthScreen.routeName:
              return pageTransitionWidget(AuthScreen());
            case HomeScreen.routeName:
              return pageTransitionWidget(HomeScreen());
            case LoginScreen.routeName:
              return pageTransitionWidget(LoginScreen());
            case ParticipantsScreen.routeName:
              return pageTransitionWidget(ParticipantsScreen());
            case PickRecipientScreen.routeName:
              return pageTransitionWidget(PickRecipientScreen());
            case RegisterScreen.routeName:
              return pageTransitionWidget(RegisterScreen());
            case ResetPasswordScreen.routeName:
              return pageTransitionWidget(ResetPasswordScreen());
          }
        },
      ),
    );
  }
}
