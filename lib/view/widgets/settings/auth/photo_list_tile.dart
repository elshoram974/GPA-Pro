import 'package:flutter/material.dart';
import 'package:gpa_pro/core/constants/assets.dart';

class PhotoListTile extends StatelessWidget {
  const PhotoListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 65,
      foregroundDecoration: profilePhotoDecoration(
        const NetworkImage(''),
      ),
      decoration: profilePhotoDecoration(
        const AssetImage(AppAssets.noProfilePic),
      ),
    );
  }

  BoxDecoration profilePhotoDecoration(ImageProvider<Object> image) {
    return BoxDecoration(
      border: Border.all(color: Colors.grey[400]!),
      shape: BoxShape.circle,
      image: DecorationImage(
        image: image,
        onError: (exception, stackTrace) {},
        fit: BoxFit.cover,
      ),
    );
  }
}