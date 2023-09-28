import 'package:http/http.dart';
import 'dart:convert';

class WordInfo {
  String? word;
  String? phonetic;
  String? audioUrl;
  String? noundef;
  String? nounExample;
  List synonymsAsNoun = [];
  List antonymsAsNoun = [];
  String? verbdef;
  String? verbExample;
  List synonymsAsVerb = [];
  List antonymsAsVerb = [];

  @override
  String toString() {
    return 'WordInfo{word: $word\n, phonetic: $phonetic\n, audioUrl: $audioUrl\n, noundef: $noundef\n, nounExample: $nounExample\n, synonymsAsNoun: $synonymsAsNoun\n, antonymsAsNoun: $antonymsAsNoun\n, verbdef: $verbdef\n, verbExample: $verbExample\n, synonymsAsVerb: $synonymsAsVerb\n, antonymsAsVerb: $antonymsAsVerb}';
  }

  WordInfo({required this.word});

  Future<void> getData() async {
    bool nounFound = false, verbFound = false;
    Response response = await get(
        Uri.https("api.dictionaryapi.dev", "api/v2/entries/en/$word"));

    //Decode JSON object to obtain the first instance
    try {
      List list = jsonDecode(response.body) as List;
      List meanings = list.elementAt(0)["meanings"] as List;

      //Set the variables consulting API info on https://dictionaryapi.dev/
      phonetic = list.elementAt(0)["phonetic"];
      audioUrl = list.elementAt(0)["phonetics"][0]["audio"];

      for (int i = 0;
          i < meanings.length && (verbFound != true || nounFound != true);
          i++) {
        if (meanings.elementAt(i)["partOfSpeech"] == "noun") {
          noundef = meanings.elementAt(i)["definitions"][0]["definition"];
          nounExample = meanings.elementAt(i)["definitions"][0]["example"];
          synonymsAsNoun =
              (meanings.elementAt(i)["definitions"][0]["synonyms"]) as List;
          antonymsAsNoun =
              (meanings.elementAt(i)["definitions"][0]["antonyms"]) as List;
          nounFound = true;
        }

        if (meanings.elementAt(i)["partOfSpeech"] == "verb") {
          verbdef = meanings.elementAt(i)["definitions"][0]["definition"];
          verbExample = meanings.elementAt(i)["definitions"][0]["example"];
          synonymsAsVerb =
              (meanings.elementAt(i)["definitions"][0]["synonyms"]) as List;
          antonymsAsVerb =
              (meanings.elementAt(i)["definitions"][0]["antonyms"]) as List;
          verbFound = true;
        }
      }
    } catch (e) {
      print("[Error]: $e");
      word = "Not Found!";
    }
  }

  void setRandomInitials(){
  }
}
