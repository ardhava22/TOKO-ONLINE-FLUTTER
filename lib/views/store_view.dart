import 'package:flutter/material.dart';
import 'package:toko_online_flutter/widgets/bottom_navbar.dart';


class StoreView extends StatefulWidget {
  const StoreView({super.key});

  @override
  State<StoreView> createState() => _StoreViewState();
}

class _StoreViewState extends State<StoreView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dapstore'),
        backgroundColor: Color.fromARGB(255, 39, 140, 127),
        foregroundColor: Colors.white,
      ),
      body: Text('Dapstore'),
      bottomNavigationBar: BottomNav(1),
    );
  }
}