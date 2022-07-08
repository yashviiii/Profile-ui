import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profile_ui/screens/gallery_screen.dart';

class Posts extends StatelessWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Gallery(),
      ),
    );
  }
}
