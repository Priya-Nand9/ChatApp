import 'dart:typed_data';

import 'package:chatapp/components/text_box.dart';
import 'package:chatapp/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  Uint8List? _image;

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  void saveProfile() async{
    //String resp = await StoreData().saveData(file: _image!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:const Text('Profile'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red, Colors.black],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 50,
          ),
  
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    _image != null ?
                    CircleAvatar(
                      radius: 65,
                      backgroundImage: MemoryImage(_image!),
                    )
                    :
                    const CircleAvatar(
                      radius: 65,
                      backgroundImage: NetworkImage(
                          'https://tse4.mm.bing.net/th?id=OIP._VoTfUzENldEmDbFEcQi4QHaHa&pid=Api&P=0&h=220'),
                    ),
                    Positioned(
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: const Color.fromARGB(255, 179, 24, 13),
                        child: IconButton(
                          onPressed: selectImage,
                          icon: const Icon(
                            Icons.add_a_photo,
                            color: Colors.white,
                            ),
                        ),
                      ),
                      bottom: 0,
                      left: 80,
                    ),
                  ],
                ),
              ],
            ),
          
          const SizedBox(
            height: 50,
          ),

          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              'User Details',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),

          //user name
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              width: 230,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 200, 49, 38),
                    Color.fromARGB(255, 119, 24, 3),
                    Color.fromARGB(255, 4, 24, 35)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: MyTextBox(
                  icon: Icons.person,
                  
                  text: currentUser.email!.replaceAll('@gmail.com', ''),        
                  sectionName: "Username"),
            ),
          ),
          //About
          
          //Email
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              width: 230,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 200, 49, 38),
                    Color.fromARGB(255, 119, 24, 3),
                    Color.fromARGB(255, 4, 24, 35)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: MyTextBox(
                  icon: Icons.email,
                  text: currentUser.email!,
                  sectionName: "Email"),
            ),
          ),

          // const SizedBox(height: 25,),
          //  ElevatedButton(
          //    onPressed: saveProfile,
          //     child: const Text('Save Profile'),
          //  ),
          
        ],
      ),
    );
  }
}
