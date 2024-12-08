import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerExample extends StatefulWidget {
  @override
  _AudioPlayerExampleState createState() => _AudioPlayerExampleState();
}

class _AudioPlayerExampleState extends State<AudioPlayerExample> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer(); // Inisialisasi AudioPlayer
  }

  // Fungsi untuk memutar audio
  Future<void> _playAudio() async {
    try {
      String audioUrl =
          'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'; // Ganti dengan URL yang valid
      await _audioPlayer
          .play(AudioSource.uri(Uri.parse(audioUrl))); // Memutar audio

      setState(() {
        _isPlaying = true;
      });
    } catch (e) {
      print('Error playing audio: $e');
    }
  }

  // Fungsi untuk menghentikan audio
  Future<void> _stopAudio() async {
    await _audioPlayer.stop();
    setState(() {
      _isPlaying = false;
    });
  }

  // Fungsi untuk menjeda audio
  Future<void> _pauseAudio() async {
    await _audioPlayer.pause();
    setState(() {
      _isPlaying = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _audioPlayer.dispose(); // Hapus objek audio player saat widget dihancurkan
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Player Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _isPlaying ? 'Audio is Playing' : 'Audio is Stopped',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            IconButton(
              icon: Icon(
                _isPlaying ? Icons.pause : Icons.play_arrow,
                size: 50,
              ),
              onPressed: _isPlaying ? _pauseAudio : _playAudio,
            ),
            SizedBox(height: 20),
            IconButton(
              icon: Icon(
                Icons.stop,
                size: 50,
              ),
              onPressed: _stopAudio,
            ),
          ],
        ),
      ),
    );
  }
}
