import 'package:flutter/material.dart';
import 'package:movie_flutter/widgets/bottom_navbar.dart';

class PesanView extends StatefulWidget {
  const PesanView({super.key});

  @override
  State<PesanView> createState() => _PesanViewState();
}

class _PesanViewState extends State<PesanView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesan'),
        backgroundColor: Color.fromARGB(255, 39, 140, 127),
        foregroundColor: Colors.white,
      ),
      body: Text('Ini adalah tampilan pesan'),
      bottomNavigationBar: BottomNavbar(1),
    );
  }
}