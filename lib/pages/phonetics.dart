import 'package:dictionary_app/services/WordInfo.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:just_audio/just_audio.dart';

class Phonetics extends StatefulWidget {
  final WordInfo instance;

  const Phonetics({Key? key, required this.instance}) : super(key: key);

  @override
  State<Phonetics> createState() => _PhoneticsState();
}

class _PhoneticsState extends State<Phonetics> {
  bool playAudio = false;

  warnUser() {
    Fluttertoast.showToast(
        msg: "Couldn't get Word's Audio!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void playClip() async {
    final player = AudioPlayer();
    await player.setUrl('${widget.instance.audioUrl}');
    await player.play();
  }

  void checkInputs() {
    widget.instance.phonetic ??= "Couldn't get word's phonetic!";
    widget.instance.audioUrl == null ? playAudio = false : playAudio = true;
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "${widget.instance.word}",
                style: const TextStyle(
                    fontSize: 70,
                    fontFamily: "Dancing",
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      " Phonetics:",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          fontFamily: "Dancing",
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Card(
                        color: Colors.grey[850],
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () async {
                                  playAudio ? playClip() : warnUser();
                                },
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.orange)),
                                child: const Icon(Icons.play_arrow),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "${widget.instance.phonetic}",
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontStyle: FontStyle.italic),
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
