import 'package:flutter/material.dart';

class SenderChatBubble extends StatelessWidget {
  final String message;
  const SenderChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8), 
        gradient: const LinearGradient(
          colors: [Color.fromARGB(255, 3, 40, 59), Color.fromARGB(255, 93, 93, 96),],
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
