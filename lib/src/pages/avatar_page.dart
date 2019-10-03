import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          CircleAvatar(
            child: Text('SL'),
            backgroundColor: Colors.blueGrey,
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage("https://i.pinimg.com/originals/d4/9f/33/d49f3302e2a4e7b5a21ea3aba0cfcf03.png"),
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage("assets/loading.gif"),
          image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTgcimp175f410WmVf04OH87qSdb4NR1HDIWCmhyAre67HkGpns"),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}