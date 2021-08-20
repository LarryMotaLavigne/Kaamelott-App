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
  bool _play = false;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Row(
          children: <Widget>[
            AudioWidget.assets(
                path: 'assets/sounds/${widget.mp3name}',
                play: _play,
                onFinished: () {
                  setState(() {
                    _play = false;
                  });
                },
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(), padding: EdgeInsets.all(15)),
                  child: Icon(
                    _play ? Icons.stop : Icons.play_arrow_rounded,
                    size: 30,
                  ),
                  onPressed: () {
                    setState(() {
                      _play = !_play;
                    });
                  },
                )),
          ],
        ),
      ),
    );
  }
}
