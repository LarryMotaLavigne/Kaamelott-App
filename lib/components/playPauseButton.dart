import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class PlayPauseButton extends StatefulWidget {
  PlayPauseButton({this.mp3name});

  final String mp3name;

  @override
  _PlayPauseButtonState createState() => _PlayPauseButtonState();
}

class _PlayPauseButtonState extends State<PlayPauseButton> {
  final assetsAudioPlayer = AssetsAudioPlayer.withId("0");
  bool isPressed = false;

  @override
  void dispose() {
    super.dispose();
    assetsAudioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Row(
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: CircleBorder(), padding: EdgeInsets.all(15)),
              child: Icon( isPressed ? Icons.pause : Icons.play_arrow,
                size: 30,
              ),
              onPressed: () {
                assetsAudioPlayer.open(Audio("assets/sounds/${widget.mp3name}"), autoStart: false);
                setState(() {
                  if (!isPressed) {
                    assetsAudioPlayer.play();
                    isPressed = true;
                  } else if (isPressed) {
                    assetsAudioPlayer.pause();
                    isPressed = false;
                  }
                });
              },
            ),
          ],
        ),
      ),
    );

    return ElevatedButton(
      child: Icon(isPressed ? Icons.pause : Icons.play_arrow),
      onPressed: () {
        assetsAudioPlayer.open(Audio("assets/audios/${widget.mp3name}.mp3"));

      },
    );
  }
}
