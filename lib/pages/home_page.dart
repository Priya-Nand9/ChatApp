import 'package:chatapp/components/chat_bubble.dart';
import 'package:chatapp/services/auth/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/blue_grey_bubble.dart';
import 'chat_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void signOut() {
    final authService = Provider.of<AuthService>(context, listen: false);
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text('ChatApp',
            style: TextStyle(
              color: Colors.white,
            )),
        // backgroundColor: const Color.fromARGB(255, 154, 28, 8),
        
            actions: [
              IconButton(
                onPressed: signOut,
                icon: const Icon(Icons.logout),
              )
            ],
            flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [ Colors.red, Colors.black],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            ),
      ),
      
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Container(
          decoration:const BoxDecoration(
            color: Colors.white,
          ),
          child: _buildUserList()),
      ),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text(
            'Error',
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 154, 28, 8),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text(
            'Loading...',
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 154, 28, 8),
            ),
          );
        }

        return ListView(
          children: snapshot.data!.docs
              .map<Widget>((doc) => _buildUserListItem(doc))
              .toList(),
        );
      },
    );
  }

  Widget _buildUserListItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    if (_auth.currentUser!.email != data['email']) {
      return ListTile(
        title: BlueGreyBubble(
          message: data["email"],
            // style: const TextStyle(
            //   fontSize: 20,
            //   color: Color.fromARGB(255, 177, 38, 17),
            ),
          
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiverUserEmail: data['email'],
                receiverUserId: data['uid'],
              ),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}
