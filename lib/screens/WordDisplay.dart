import 'package:dictionary_app/pages/noun.dart';
import 'package:dictionary_app/pages/phonetics.dart';
import 'package:dictionary_app/pages/verb.dart';
import 'package:dictionary_app/services/WordInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WordDisplay extends StatefulWidget {
  const WordDisplay({Key? key}) : super(key: key);

  @override
  State<WordDisplay> createState() => _WordDisplayState();
}

class _WordDisplayState extends State<WordDisplay> {
  int selectedIndex = 0;

  void navigateBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    WordInfo instance = ((ModalRoute.of(context)!.settings.arguments
        as Map)["wordInfo"]) as WordInfo;

    List<Widget> pages = [
      Phonetics(instance: instance),
      Noun(instance: instance),
      Verb(instance: instance)
    ];

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
        backgroundColor: Colors.grey[900],
        bottomNavigationBar: BottomNavigationBar(
          onTap: navigateBar,
          currentIndex: selectedIndex,
          type: BottomNavigationBarType.fixed,
          unselectedLabelStyle:
              const TextStyle(fontFamily: "Dancing", fontSize: 15),
          unselectedItemColor: Colors.white,
          selectedLabelStyle:
              const TextStyle(fontFamily: "Dancing", fontSize: 15),
          backgroundColor: Colors.blueGrey[900],
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.import_contacts_sharp, color: Colors.orange),
                label: "Phonetics"),
            BottomNavigationBarItem(
                icon: Icon(Icons.import_contacts_sharp, color: Colors.orange),
                label: "Noun"),
            BottomNavigationBarItem(
              icon: Icon(Icons.import_contacts_sharp, color: Colors.orange),
              label: "Verb",
            ),
          ],
        ),
        body: pages[selectedIndex]);
  }
}
