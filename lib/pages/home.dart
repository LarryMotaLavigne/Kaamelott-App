import 'package:K/components/kCard.dart';
import 'package:K/loader.dart';
import 'package:K/variables.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final audioPlayer = AssetsAudioPlayer.withId(Variables.appTitle);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text(
                Variables.appTitle,
                style: TextStyle(fontFamily: 'Folkard'),
              ),
              flexibleSpace: Image(
                image: AssetImage(Variables.appBarImage),
                fit: BoxFit.cover,
              ),
              backgroundColor: Variables.appBarColor,
            ),
            body: Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: FutureBuilder(
                      future: Loader().loadJson(),
                      builder: (_, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  height: 220,
                                  width: double.maxFinite,
                                  child: KCard(snapshot.data, index, audioPlayer),
                                );
                              });
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )));
  }
}
