// ignore: file_names
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import 'dart:io';

class ImagePickerExample extends StatefulWidget {
  const ImagePickerExample({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ImagePickerExampleState createState() => _ImagePickerExampleState();
}

class _ImagePickerExampleState extends State<ImagePickerExample> {
  File? _image; // Untuk menyimpan gambar yang dipilih

  final ImagePicker _picker = ImagePicker();
// Fungsi untuk memilih gambar dari galeri

  Future<void> _pickImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

// Fungsi untuk mengambil gambar dengan kamera

  Future<void> _pickImageFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image != null
                ? Image.file(
                    _image!,

                    width: 200,

// height: 200,

                    fit: BoxFit.cover,
                  )
                : Text('No image selected.'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImageFromGallery,
              child: Text('Pick Image from Gallery'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _pickImageFromCamera,
              child: Text('Take Photo with Camera'),
            ),
          ],
        ),
      ),
    );
  }
}
