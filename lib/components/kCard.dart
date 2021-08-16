import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class KCard extends StatelessWidget {
  var data;
  final int index;
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

  KCard(this.data, this.index);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 2.0, color: Colors.brown),
          ),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.all(7),
          child: Stack(children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: Stack(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              characterIcon(data[index]),
                              SizedBox(
                                height: 10,
                              ),
                              characterName(data[index]),
                              SizedBox(
                                width: 20,
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[playButton(data[index])],
                          )
                        ],
                      ))
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  Widget characterIcon(data) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Icon(
            Icons.person,
            size: 40,
          )),
    );
  }

  Widget characterName(data) {
    return Align(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          text: '${data['character']}',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
          children: <TextSpan>[
            TextSpan(
                text: '\n${data['episode']}',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget playButton(data) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Row(
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: CircleBorder(), padding: EdgeInsets.all(15)),
              child: Icon(
                Icons.play_arrow,
                size: 30,
              ),
              onPressed: () {
                audioPlayer.open(
                  Audio("assets/audios/interprete.mp3"),
                  showNotification: true,
                  autoStart: true,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
