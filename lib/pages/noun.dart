import 'package:flutter/material.dart';

import '../services/WordInfo.dart';

class Noun extends StatefulWidget {
  final WordInfo instance;

  const Noun({Key? key, required this.instance}) : super(key: key);

  @override
  State<Noun> createState() => _NounState();
}

class _NounState extends State<Noun> {

  void checkInputs() {
    widget.instance.noundef ??= "Couldn't get noun's definition!";
    widget.instance.nounExample ??= "Couldn't get noun's example!";

    if (widget.instance.synonymsAsNoun.isEmpty) {
      widget.instance.synonymsAsNoun = ["Couldn't get noun's synonyms!"];
    }

    if (widget.instance.antonymsAsNoun.isEmpty) {
      widget.instance.antonymsAsNoun = ["Couldn't get noun's antonyms!"];
    }
  }

  @override
  Widget build(BuildContext context) {
    checkInputs();
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.black12, Colors.black45],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight)),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text(
                    "${widget.instance.word}",
                    style: const TextStyle(
                        fontSize: 70,
                        fontFamily: "Dancing",
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  " '${widget.instance.word}' as a noun:",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      fontFamily: "Dancing",
                      color: Colors.white),
                ),
                Card(
                    semanticContainer: true,
                    color: Colors.grey[850],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Image.asset("assets/noun.jpg"),
                        ),
                        const Text(
                          " Definition:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              fontFamily: "Dancing",
                              color: Colors.orange),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Card(
                            color: Colors.grey[600],
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                "${widget.instance.noundef}",
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          " Example:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              fontFamily: "Dancing",
                              color: Colors.orange),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Card(
                            color: Colors.grey[600],
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                "${widget.instance.nounExample}",
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          " Synonyms:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              fontFamily: "Dancing",
                              color: Colors.orange),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Card(
                            color: Colors.grey[600],
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                widget.instance.synonymsAsNoun.toString().substring(
                                    1,
                                    widget.instance.synonymsAsNoun.toString().length -
                                        1),
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          " Antonyms:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              fontFamily: "Dancing",
                              color: Colors.orange),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Card(
                            color: Colors.grey[600],
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                widget.instance.antonymsAsNoun.toString().substring(
                                    1,
                                    widget.instance.antonymsAsNoun.toString().length -
                                        1),
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        )
                      ],
                    )),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
