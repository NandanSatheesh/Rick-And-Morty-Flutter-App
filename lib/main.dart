import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pagination_flutter/character/character_screen.dart';
import 'package:pagination_flutter/episode/episode_screen.dart';
import 'package:pagination_flutter/location/location_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Rick and Morty Font',
        brightness: Brightness.dark,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RMDB'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            getColumnWithImageAndText('images/characters.png', 'Characters',
                () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CharacterScreen()),
              );
            }),
            getColumnWithImageAndText('images/locations.png', 'Locations', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LocationScreen()),
              );
            }),
            getColumnWithImageAndText('images/episodes.png', 'Episodes', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EpisodeScreen()),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget getColumnWithImageAndText(
      String imageAsset, String title, Function onTapCallback) {
    return GestureDetector(
      onTap: onTapCallback,
      child: Column(
        children: <Widget>[
          Image.asset(
            imageAsset,
            width: 120,
            height: 120,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 48),
          )
        ],
      ),
    );
  }
}
