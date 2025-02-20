// import 'package:flutter/material.dart';

// void main() {
//   runApp(BottomNavbar());
// }

// class BottomNavbar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Navbar Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _selectedIndex = 0;

//   static const List<Widget> _widgetOptions = <Widget>[
//     Text('Home Page'),
//     Text('Tugas Page'),
//     Text('KasPiket Page'),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Navbar Example'),
//       ),
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.assignment),
//             label: 'Tugas',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.attach_money),
//             label: 'KasPiket',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.blue,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:movie_flutter/models/user_login.dart';

class BottomNavbar extends StatefulWidget {
  int activePage;
  BottomNavbar(this.activePage);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
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
    if (role == "admin") {
      if (index == 0) {
        Navigator.pushReplacementNamed(context, '/dashboard');
      }
      else if (index == 1) {
        Navigator.pushReplacementNamed(context, '/movie');
      }
    } else if (role == "kasir") {
      if (index == 0) {
        Navigator.pushReplacementNamed(context, '/dashboard');
      } else if (index == 1) {
        Navigator.pushReplacementNamed(context, '/pesan');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return role == "admin"
    ? BottomNavigationBar(
      selectedItemColor: Color.fromARGB(255, 39, 140, 127),
      unselectedItemColor: Colors.grey,
      currentIndex: widget.activePage,
      onTap: (index) => {getLink(index)},
      items: [
        BottomNavigationBarItem(
          icon: Icon(IconlyBroken.home),
          label: "Home"),
        BottomNavigationBarItem(
          icon: Icon(IconlyBroken.message),
          label: "Movie")
      ],
    )
    : role == "user"
      ? BottomNavigationBar(
      selectedItemColor: Color.fromARGB(255, 39, 140, 127),
      unselectedItemColor: Colors.grey,
      currentIndex: widget.activePage,
      onTap: (index) => {getLink(index)},
      items: [
        BottomNavigationBarItem(
          icon: Icon(IconlyBroken.home),
          label: "Home"),
        BottomNavigationBarItem(
          icon: Icon(IconlyBroken.message),
          label: "Pesan"),
      ],
    ) : Text("");
  }
}