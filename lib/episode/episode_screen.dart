import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pagination_flutter/episode/episode_details.dart';
import 'package:pagination_flutter/model/episode.dart';
import 'package:paging/paging.dart';

class EpisodeScreen extends StatefulWidget {
  EpisodeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _EpisodeScreenState createState() => _EpisodeScreenState();
}

class _EpisodeScreenState extends State<EpisodeScreen> {
  static int pageNumber = 1;

  Future<List<Result>> pageData() async {
    final response = await http.Client()
        .get('https://rickandmortyapi.com/api/episode/?page=$pageNumber');
    pageNumber++;
    var characterResponse =
        EpisodeResponse.fromJson(json.decode(response.body));
    return characterResponse.results;
  }

  @override
  void initState() {
    super.initState();
    pageNumber = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Episode List')),
      body: Pagination<Result>(
        pageBuilder: (currentSize) => pageData(),
        itemBuilder: (index, item) {
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EpisodeDetails(data: item)),
              );
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(16, 16, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        item.name,
                        style: TextStyle(fontSize: 24),
                      ),
                      Text(
                        item.episode,
                        style: TextStyle(fontSize: 24),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Divider(
                    height: 12,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
