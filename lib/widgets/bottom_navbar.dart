
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:toko_online_flutter/models/user_login.dart';

class BottomNav extends StatefulWidget {
  int activePage;
  BottomNav(this.activePage);

  @override
  State<BottomNav> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNav> {
  UserLogin userLogin = UserLogin();
  String? role;
  getDataLogin() async {
    var user = await userLogin!.getUserLogin();
    if (user!.status != false) {
      setState(() {
        role = user.role;
      });
    } else {
      Navigator.popAndPushNamed(context, "/Login");
    }
  }
  @override
  void initState() {
    super.initState();
    getDataLogin();
  }

  void getLink(index) {
    if (role == "kasir") {
      if (index == 0) {
        Navigator.pushReplacementNamed(context, '/dashboard');
      }
      else if (index == 1) {
        Navigator.pushReplacementNamed(context, '/barang');
      }
      else if (index == 2) {
        Navigator.pushReplacementNamed(context, '/transaksi');
      }
      else if (index == 3) {
        Navigator.pushReplacementNamed(context, '/akun_kasir');
      }

    } else if (role == "pelanggan") {
      if (index == 0) {
        Navigator.pushReplacementNamed(context, '/dashboard');
      } 
      else if (index == 1) {
        Navigator.pushReplacementNamed(context, '/store');
      } 
      else if (index == 2) {
        Navigator.pushReplacementNamed(context, '/pesan');
      } 
      else if (index == 3) {
        Navigator.pushReplacementNamed(context, '/akun_pelanggan');
      } 
    }
  }

  @override
  Widget build(BuildContext context) {
    return role == "kasir"
    ? BottomNavigationBar(
      selectedItemColor: Color.fromARGB(255, 39, 140, 127),
      unselectedItemColor: Colors.grey,
      currentIndex: widget.activePage,
      onTap: (index) => {getLink(index)},
      items: [
        BottomNavigationBarItem(
          icon: Icon(IconlyLight.home),
          label: "Home"),
        BottomNavigationBarItem(
          icon: Icon(IconlyLight.activity),
          label: "Barang"),
        BottomNavigationBarItem(
          icon: Icon(IconlyBroken.message),
          label: "Transaksi"),
        BottomNavigationBarItem(
          icon: Icon(IconlyBroken.message),
          label: "Akun"),
      ],
    )
    : role == "pelanggan"
      ? BottomNavigationBar(
      selectedItemColor: Color.fromARGB(255, 39, 140, 127),
      unselectedItemColor: Colors.grey,
      currentIndex: widget.activePage,
      onTap: (index) => {getLink(index)},
      items: [
        BottomNavigationBarItem(
          icon: Icon(IconlyLight.home),
          label: "Home"),
        BottomNavigationBarItem(
          icon: Icon(IconlyLight.chart),
          label: "Store"),
        BottomNavigationBarItem(
          icon: Icon(IconlyLight.message),
          label: "Pesan"),
        BottomNavigationBarItem(
          icon: Icon(IconlyLight.user),
          label: "Akun"),
      ],
    ) : Text("");
  }
}