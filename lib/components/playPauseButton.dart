import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class PlayPauseButton extends StatefulWidget {
  PlayPauseButton({this.mp3name, this.audioPlayer});

  final String mp3name;
  final audioPlayer;

  @override
  _PlayPauseButtonState createState() => _PlayPauseButtonState();
}

class _PlayPauseButtonState extends State<PlayPauseButton> {
  bool isPressed = false;

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
              child: Icon(
                isPressed ? Icons.pause : Icons.play_arrow,
                size: 30,
              ),
              onPressed: () {
                setState(() {
                  if (!isPressed) {
                    widget.audioPlayer.open(
                        Audio("assets/sounds/${widget.mp3name}"));
                    isPressed = true;
                  } else if (isPressed) {
                    widget.audioPlayer.pause();
                    isPressed = false;
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
