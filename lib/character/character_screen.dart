import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pagination_flutter/character/character_details.dart';
import 'package:pagination_flutter/model/character.dart';
import 'package:paging/paging.dart';

class CharacterScreen extends StatefulWidget {
  CharacterScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CharacterScreenState createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  static int pageNumber = 1;

  @override
  void initState() {
    super.initState();
    pageNumber = 1;
  }

  Future<List<Result>> pageData() async {
    final response = await http.Client()
        .get('https://rickandmortyapi.com/api/character/?page=$pageNumber');
    pageNumber++;
    var characterResponse =
        CharacterResponse.fromJson(json.decode(response.body));
    return characterResponse.results;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Characters List')),
      body: Pagination<Result>(
        pageBuilder: (currentSize) => pageData(),
        itemBuilder: (index, item) {
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        CharacterDetails(characterData: item)),
              );
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(16, 16, 24, 0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Image.network(
                          item.image,
                          width: 64,
                          height: 64,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          flex: 8,
                          child: Text(
                            item.name,
                            style: TextStyle(fontSize: 24),
                          ))
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
