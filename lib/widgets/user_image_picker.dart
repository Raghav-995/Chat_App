import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({super.key, required this.onPickedImage});
  final void Function(File pickedImage) onPickedImage;
  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _pickedImagePath;

  void _selectImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 30.0,
      imageQuality: 50,
    );
    if (pickedImage == null) {
      return;
    }
    setState(() {
      _pickedImagePath = File(pickedImage.path);
    });
    widget.onPickedImage(_pickedImagePath!);
  }

  @override
  Widget build(context) {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 40.0,
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            backgroundImage:
                _pickedImagePath != null ? FileImage(_pickedImagePath!) : null,
          ),
          TextButton.icon(
            onPressed: _selectImage,
            label: Text(
              'Add Image',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            icon: const Icon(Icons.image),
          )
        ],
      ),
    );
  }
}
