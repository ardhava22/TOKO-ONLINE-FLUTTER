import 'package:flutter/material.dart';
import 'package:movie_flutter/views/dashboard_view.dart';
import 'package:movie_flutter/views/login_view.dart';
import 'package:movie_flutter/views/store_view.dart';
import 'package:movie_flutter/views/pesan_view.dart';
import 'package:movie_flutter/views/register_user_view.dart';
import 'package:movie_flutter/widgets/bottom_navbar.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/navbar': (context) => BottomNavbar(0),
      '/': (context) => RegisterUserView(),
      '/login': (context) => LoginView(),
      '/dashboard': (context) => DashboardView(),
      '/movie': (context) => MovieView(),
      '/pesan': (context) => PesanView(),
    },
  ));
}
