import 'package:dictionary_app/screens/Home.dart';
import 'package:dictionary_app/screens/Loading.dart';
import 'package:dictionary_app/screens/WordDisplay.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Worctionary",
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes: {
      "/" : (context) => const Loading(),
      "/home" : (context) => const Home(),
      "/word" : (context) => const WordDisplay(),
    },
  ));
}

