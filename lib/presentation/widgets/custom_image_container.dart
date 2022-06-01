import 'dart:typed_data';

import 'package:dating_app/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class CustomImageContainer extends StatelessWidget {
  final String? imageUrl;

  const CustomImageContainer({
    Key? key,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, right: 10.0),
      child: Container(
        height: 150,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: const Border(
            bottom: BorderSide(
              color: Colors.blueGrey,
              width: 1,
            ),
            top: BorderSide(
              color: Colors.blueGrey,
              width: 1,
            ),
            left: BorderSide(
              color: Colors.blueGrey,
              width: 1,
            ),
            right: BorderSide(
              color: Colors.blueGrey,
              width: 1,
            ),
          ),
        ),
        child: (imageUrl == null)
            ? Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  icon: const Icon(
                    Icons.add_circle,
                    color: Colors.red,
                  ),
                  onPressed: () async {
                    ImagePicker _picker = ImagePicker();
                    final XFile? _image =
                        await _picker.pickImage(source: ImageSource.gallery);

                    if (_image == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('No image selected'),
                        ),
                      );
                    }

                    if (_image != null) {
                      print('Uploading...');
                      context.read<OnboardingBloc>().add(
                            UpdateUserImages(image: _image),
                          );
                    }
                  },
                ),
              )
            : Image.network(
                imageUrl!,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
