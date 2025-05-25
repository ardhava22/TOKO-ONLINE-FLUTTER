import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:toko_online_flutter/models/user_login.dart';
import 'package:toko_online_flutter/widgets/bottom_navbar.dart';


class DashboardView extends StatefulWidget {
  const DashboardView({super.key});


  @override
  State<DashboardView> createState() => _DashboardViewState();
}


class _DashboardViewState extends State<DashboardView> {
  UserLogin userLogin = UserLogin();
  String? name;
  String? role;
  getUserLogin() async {
    var user = await userLogin.getUserLogin();
    if (user.status != false) {
      setState(() {
        name = user.name;
        role = user.role;
      });
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserLogin();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        backgroundColor: Color.fromARGB(255, 39, 140, 127),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/login');
              },
              icon: Icon(IconlyLight.logout))
        ],
      ),
      body: Center(child: Text("Selamat Datang $name role anda $role")),
      bottomNavigationBar: BottomNav(0),
    );
  }
}


