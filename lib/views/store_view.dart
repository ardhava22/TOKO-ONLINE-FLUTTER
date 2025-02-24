import 'package:flutter/material.dart';
import 'package:movie_flutter/widgets/bottom_navbar.dart';

class MovieView extends StatefulWidget {
  const MovieView({super.key});

  @override
  State<MovieView> createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dapstore'),
        backgroundColor: Color.fromARGB(255, 39, 140, 127),
        foregroundColor: Colors.white,
      ),
      body: Text('Dapstore'),
      bottomNavigationBar: BottomNavbar(1),
    );
  }
}