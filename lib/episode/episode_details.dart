import 'package:flutter/material.dart';
import 'package:pagination_flutter/model/episode.dart';
import 'package:pagination_flutter/ui/table_row.dart';

class EpisodeDetails extends StatelessWidget {
  final Result data;

  @required
  EpisodeDetails({@required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Details'),
      ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 24,
            ),
            Center(
              child: Text(
                data.name,
                style: TextStyle(fontSize: 32),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TableRowDetails(
              title: 'Episode',
              value: data.episode,
            ),
            TableRowDetails(
              title: 'Air Date',
              value: data.airDate,
            ),
          ],
        ),
      ),
    );
  }
}
