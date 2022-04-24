import 'package:e_comerce_app/data/repository/repository.dart';
import 'package:e_comerce_app/presentation/BloCs/auth_bloc/auth_bloc.dart';
import 'package:e_comerce_app/presentation/screens/auth/auth_screen.dart';
import 'package:e_comerce_app/presentation/screens/auth/register_screen.dart';
import 'package:e_comerce_app/presentation/screens/menu/cart_screen.dart';
import 'package:e_comerce_app/presentation/screens/menu/home_screen.dart';
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
            routes: {
              '/signInScreen': (context) => SignInFormPage(),
              '/registerScreen': (context) => const RegisterScreen(),
              '/dashBoard': (context) => const NavigationScreen(),
              '/favoriteScreen': (context) => const FavoriteScreen(),
              '/profileScreen': (context) => const ProfileScreen(),
              '/cartScreen': (context) => const CartScreen(),
            },
            theme: ThemeData(
              primaryColor: Colors.red,
              primarySwatch: Colors.orangeAccent[0xfffdb911a],
            ),
            home: const AuthScreen()),
      ),
    );
  }
}
