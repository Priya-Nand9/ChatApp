import 'package:flutter/material.dart';

class BlueGreyBubble extends StatelessWidget {
  String message;
  BlueGreyBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
       // color: const Color.fromARGB(255, 34, 5, 104),
        gradient: const LinearGradient(
          colors: [ Color.fromARGB(255, 200, 49, 38), Color.fromARGB(255, 119, 24, 3), Color.fromARGB(255, 4, 24, 35)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      
      child: Text(
        message,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}
