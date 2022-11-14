import 'package:flutter/material.dart';
import 'package:flutter_star_rating/star_rating/views/star_rating_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Rate My App",
      theme: ThemeData(
        primaryColor: Colors.blue,
        fontFamily: "Lato",
      ),
      home: RatingBar(),
    );
  }
}
