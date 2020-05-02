import 'package:flacker/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/user_location.dart';
import 'services/location_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<CurrentLocation>(
        create: (context) => LocationService().locationStream,
        child: MaterialApp(title: 'Flutter Demo', home: HomeView()));
  }
}
