import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.black54,
        ),
        title: Text(
          "Movies".toUpperCase(),
          style: Theme.of(context).textTheme.caption?.copyWith(
              color: Colors.black54,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              fontFamily: 'Muli'),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 15),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/image/logo.jpeg'),
            ),
          )
        ],
      ),
    );
  }
}
