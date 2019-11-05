import 'package:flutter/material.dart';
import 'package:pagination_flutter/model/location.dart';
import 'package:pagination_flutter/ui/table_row.dart';

class LocationDetails extends StatelessWidget {
  final Result data;

  @required
  LocationDetails({@required this.data});

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
              title: 'Type',
              value: data.type,
            ),
            TableRowDetails(
              title: 'Dimensions',
              value: data.dimension,
            ),
          ],
        ),
      ),
    );
  }
}
