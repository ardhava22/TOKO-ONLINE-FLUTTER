import 'package:flutter/material.dart';
import 'package:toko_online_flutter/widgets/bottom_navbar.dart';

class AkunView extends StatefulWidget {
  const AkunView({super.key});

  @override
  State<AkunView> createState() => _AkunViewState();
}

class _AkunViewState extends State<AkunView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Akun'),
        backgroundColor:  Color.fromARGB(255, 39, 140, 127),
        foregroundColor: Colors.white,
      ),
      body: 
      Text("Tampilan akun"),
      bottomNavigationBar: BottomNav(3),
    );
  }
}