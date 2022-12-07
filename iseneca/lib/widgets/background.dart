import 'package:flutter/material.dart';
class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 8],
            colors: [Color(0xff005298), Color(0xff01315a)],
          ),
        ),
        child: const Image(
          image: AssetImage('assets/iseneca .png'),
          width: double.infinity,
          height: 150,
        ),
      ),
      Container(
        color: Colors.white,
      ),
    ]);
  }
}