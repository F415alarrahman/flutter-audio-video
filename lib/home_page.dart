import 'package:flutter/material.dart';
import 'package:image_video/Audio_Player_Example.dart';
import 'package:image_video/Image_Picker_Example.dart';
import 'package:image_video/Video_Player_Example.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker Example'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ImagePickerExample(),
                  ),
                );
              },
              child: const Text('Image_picker'),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoPlayerExample(),
                  ),
                );
              },
              child: const Text('Video player'),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AudioPlayerExample(),
                  ),
                );
              },
              child: const Text('Audio player'),
            ),
          ],
        ),
      ),
    );
  }
}
