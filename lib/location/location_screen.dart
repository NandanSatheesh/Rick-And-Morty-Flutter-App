import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pagination_flutter/location/location_details.dart';
import 'package:pagination_flutter/model/location.dart';
import 'package:paging/paging.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  static int pageNumber = 1;

  Future<List<Result>> pageData() async {
    final response = await http.Client()
        .get('https://rickandmortyapi.com/api/location/?page=$pageNumber');
    pageNumber++;
    var characterResponse =
        LocationResponse.fromJson(json.decode(response.body));
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
      appBar: AppBar(title: Text('Location List')),
      body: Pagination<Result>(
        pageBuilder: (currentSize) => pageData(),
        itemBuilder: (index, item) {
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LocationDetails(data: item)),
              );
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(16, 16, 24, 0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        item.name,
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
