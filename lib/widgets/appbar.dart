import 'package:flutter/material.dart';
import 'package:profile_ui/screens/posts.dart';

Widget appbar(BuildContext context){
  return AppBar(
    leading:
    Builder(builder: (BuildContext context) {
      return IconButton(
        onPressed: (){},
        icon:
        GestureDetector(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => Posts())
            );
          },
          child: Image.asset(
            'assets/images/logo.png',
            height: 40,
            width: 50,
          ),
        ),
      );
    }
    ),
    backgroundColor: Colors.white,
    title: Center(
      child: Text(
        "Socio-Club",
        style:
        TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w900,
          fontStyle: FontStyle.italic,
        ),
      ),
    ),
    actions: [
      // IconButton(
      //   icon: Icon(
      //     Icons.add_box_outlined,
      //     color: Colors.black,
      //   ),
      //   onPressed: () => print("Add"),
      // ),
      IconButton(
        icon: Icon(
          Icons.settings,
          color: Colors.black,
        ),
        onPressed: () => print("Add"),
      )
    ],
  );
}