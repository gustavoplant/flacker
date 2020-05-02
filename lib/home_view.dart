import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/user_location.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userLocation = Provider.of<CurrentLocation>(context);

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Flacker teste'),
          ),
          body: Container(
              width: double.infinity,
              margin: EdgeInsets.all(10),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          'Latitude: ',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '${userLocation?.latitude}',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Longitude: ',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '${userLocation?.longitude}',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'accuracy: ',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '${userLocation?.accuracy}',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'altitude: ',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '${userLocation?.altitude}',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'heading: ',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '${userLocation?.heading}',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'speed: ',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '${userLocation?.speed}',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'speedAccuracy: ',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '${userLocation?.speedAccuracy}',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'time: ',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '${userLocation?.time}',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ))),
    );
  }
}
