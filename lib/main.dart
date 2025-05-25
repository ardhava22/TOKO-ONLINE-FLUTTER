import 'package:flutter/material.dart';
import 'package:toko_online_flutter/views/akun_view.dart';
import 'package:toko_online_flutter/views/barang_view.dart';
import 'package:toko_online_flutter/views/dashboard_view.dart';
import 'package:toko_online_flutter/views/login_view.dart';
import 'package:toko_online_flutter/views/store_view.dart';
import 'package:toko_online_flutter/views/pesan_view.dart';
import 'package:toko_online_flutter/views/register_user_view.dart';
import 'package:toko_online_flutter/widgets/bottom_navbar.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/navbar': (context) => BottomNav(0),
      '/': (context) => RegisterUserView(),
      '/login': (context) => LoginView(),
      '/dashboard': (context) => DashboardView(),
      '/pesan': (context) => PesanView(),
      '/store': (context) => StoreView(),
      '/akun_pelanggan': (context) => AkunView(),
      '/barang': (context) => BarangView(),
    },
  ));
}
