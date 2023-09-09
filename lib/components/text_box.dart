import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {
  final String text;
  final IconData icon;
  final String sectionName;
  const MyTextBox({super.key,required this.icon, required this.text, required this.sectionName});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[20],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.only(
        left: 15,
        bottom: 15,
      ),
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 40,
          ),
          const SizedBox(width: 30,),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //Section Name
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,              
              children: [
                Text(
                  sectionName,
                  style: TextStyle(
                    color: Colors.grey[300],
                  ),
                ),

                //Spacer(),

                //Edit button
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                    color: Color.fromARGB(255, 253, 253, 253),
                    
                  ),
                ),
              ],
            ),
            //text
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
