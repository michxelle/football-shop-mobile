import 'package:flutter/material.dart';
import 'package:football_shop/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

const Color footballShopPrimaryColor = Color(0xFF228B22);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Footballed Co.',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green).copyWith(
            secondary: Colors.green[700],
            primary: footballShopPrimaryColor, 
          ),
          useMaterial3: true,
          
          appBarTheme: const AppBarTheme(
            backgroundColor: footballShopPrimaryColor,
            foregroundColor: Colors.white,
          ),
          
          drawerTheme: const DrawerThemeData(
            backgroundColor: Colors.white,
          ),
          
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: const WidgetStatePropertyAll(footballShopPrimaryColor),
              foregroundColor: const WidgetStatePropertyAll(Colors.white),
            ),
          ),
        ),
        home: const LoginPage(),
      ),
    );
  }
}