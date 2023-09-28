import 'package:dictionary_app/services/WordInfo.dart';
import 'package:flutter/material.dart';

class Verb extends StatefulWidget {
  final WordInfo instance;

  const Verb({Key? key, required this.instance}) : super(key: key);

  @override
  State<Verb> createState() => _VerbState();
}

class _VerbState extends State<Verb> {
  void checkInputs() {
    widget.instance.verbdef ??= "Couldn't get verb's definition!";
    widget.instance.verbExample ??= "Couldn't get verb's example!";

    if (widget.instance.synonymsAsVerb.isEmpty) {
      widget.instance.synonymsAsVerb = ["Couldn't get verb's synonyms!"];
    }

    if (widget.instance.antonymsAsVerb.isEmpty) {
      widget.instance.antonymsAsVerb = ["Couldn't get verb's antonyms!"];
    }
  }

  @override
  Widget build(BuildContext context) {
    checkInputs();
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black12, Colors.black45],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight)),
          child: ListView(
            children: <Widget>[
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
                " '${widget.instance.word}' as a verb:",
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
                        child: Image.asset("assets/verb.png"),
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
                              "${widget.instance.verbdef}",
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
                              "${widget.instance.verbExample}",
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
                              widget.instance.synonymsAsVerb
                                  .toString()
                                  .substring(
                                      1,
                                      widget.instance.synonymsAsVerb
                                              .toString()
                                              .length -
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
                              widget.instance.antonymsAsVerb
                                  .toString()
                                  .substring(
                                      1,
                                      widget.instance.antonymsAsVerb
                                              .toString()
                                              .length -
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
