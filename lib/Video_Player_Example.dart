import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import 'package:video_player/video_player.dart';

import 'dart:io';

class VideoPlayerExample extends StatefulWidget {
  @override
  _VideoPlayerExampleState createState() => _VideoPlayerExampleState();
}

class _VideoPlayerExampleState extends State<VideoPlayerExample> {
  late VideoPlayerController _controller;

  File? _videoFile;

  bool _isPlaying = false;

  final ImagePicker _picker = ImagePicker();

// Fungsi untuk memilih video dari galeri atau penyimpanan

  Future<void> _pickVideo() async {
    final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);

    if (video != null) {
      setState(() {
        _videoFile = File(video.path);
      });

      _initializeVideo();
    }
  }

// Inisialisasi controller video

  void _initializeVideo() {
    _controller = VideoPlayerController.file(_videoFile!)
      ..initialize().then((_) {
        setState(() {});
      });
  }

// Fungsi untuk play/pause video

  void _togglePlayPause() {
    setState(() {
      if (_isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }

      _isPlaying = !_isPlaying;
    });
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose(); // Hapus controller saat widget dihancurkan
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Picker and Player'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
// Menampilkan video jika sudah dipilih dan diinisialisasi

            _videoFile != null && _controller.value.isInitialized
                ? Column(
                    children: [
                      AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                      IconButton(
                        icon: Icon(
                          _isPlaying ? Icons.pause : Icons.play_arrow,
                          size: 50,
                        ),
                        onPressed: _togglePlayPause,
                      ),
                    ],
                  )
                : Text('No video selected'),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: _pickVideo, // Tombol untuk memilih video

              child: Text('Pick Video'),
            ),
          ],
        ),
      ),
    );
  }
}
