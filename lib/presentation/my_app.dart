import 'package:e_comerce_app/data/repository/repository.dart';
import 'package:e_comerce_app/presentation/BloCs/auth_bloc/auth_bloc.dart';
import 'package:e_comerce_app/presentation/screens/auth/auth_screen.dart';
import 'package:e_comerce_app/presentation/screens/auth/register_screen.dart';
import 'package:e_comerce_app/presentation/screens/menu/cart_screen.dart';
import 'package:e_comerce_app/presentation/screens/menu/favorite_screen.dart';
import 'package:e_comerce_app/presentation/screens/menu/navigation_screen.dart';
import 'package:e_comerce_app/presentation/screens/menu/profile_screen.dart';
import 'package:e_comerce_app/presentation/screens/widgets/auth/sign_in_form_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) => AuthBloc(
          authRepository: RepositoryProvider.of<AuthRepository>(context),
        ),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            routes: <String, WidgetBuilder>{
              '/authScreen': (context) => const AuthScreen(),
              '/signInScreen': (context) => SignInFormPage(),
              '/registerScreen': (context) => const RegisterScreen(),
              '/dashBoard': (context) => NavigationScreen(),
              '/favoriteScreen': (context) => const FavoriteScreen(),
              '/profileScreen': (context) => const ProfileScreen(),
              '/cartScreen': (context) => const CartScreen(),
            },
            theme: ThemeData(
              colorScheme: const ColorScheme(
                  primary: Colors.white,
                  primaryVariant: Colors.white,
                  secondary: Colors.black,
                  secondaryVariant: Colors.black,
                  surface: Colors.yellow,
                  background: Colors.brown,
                  error: Colors.red,
                  onPrimary: Colors.black,
                  onSecondary: Colors.black12,
                  onSurface: Colors.black,
                  onBackground: Colors.black,
                  onError: Colors.white,
                  brightness: Brightness.light),
            ),
            home: const AuthScreen()),
      ),
    );
  }
}
