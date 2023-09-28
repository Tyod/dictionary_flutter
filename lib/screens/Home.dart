import 'package:dictionary_app/services/WordInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final myController = TextEditingController();
  WordInfo? instance;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.black12, Colors.black45],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          )),
          child: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Text(
                      "Worctionary",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 55,
                        fontFamily: "Dancing",
                      ),
                    ),
                  ),
                  Image.asset(
                    "assets/book.png",
                    width: 60,
                    height: 60,
                  )
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: TextFormField(
                  controller: myController,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                  decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      border: UnderlineInputBorder(),
                      labelText: "Search for a word...",
                      labelStyle: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
            ],
          )),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await setUpWordInfo()
              ? Navigator.pushNamed(context, "/word",
                  arguments: {"wordInfo": instance})
              : warnUser();
        },
        backgroundColor: Colors.yellow[900],
        icon: const Icon(Icons.search),
        label: const Text("Search"),
      ),
    );
  }

  Future<bool> setUpWordInfo() async {
    if (myController.text != "") {
      instance = WordInfo(word: myController.text);
      await instance!.getData();

      if(instance!.word == "Not Found!"){
        return false;
      }else{
        return true;
      }
    }

    return false;
  }

  warnUser() {
    Fluttertoast.showToast(
        msg: "Couldn't find searched word!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
