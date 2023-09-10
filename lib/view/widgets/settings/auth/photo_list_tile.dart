import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gpa_pro/core/constants/app_links.dart';
import 'package:gpa_pro/core/constants/assets.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/data/model/user.dart';

class PhotoListTile extends StatelessWidget {
  const PhotoListTile(this.userData, {super.key});
  final UserData? userData;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 50,
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(AppConstant.kDefaultRadius),
        child: Visibility(
          visible: userData?.userImage != null,
          replacement: const StaticImage(),
          child: CachedNetworkImage(
            imageUrl: "${AppLinks.image}/${userData?.userImage}",
            imageBuilder: (context, imageProvider) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Padding(
              padding: const EdgeInsets.all(AppConstant.kDefaultPadding / 2),
              child:
                  CircularProgressIndicator(value: downloadProgress.progress),
            ),
            errorWidget: (context, url, error) => const StaticImage(),
          ),
        ),
      ),
    );
    // return Container(
    //   height: 65,
    //   width: 65,
    //   foregroundDecoration: profilePhotoDecoration(
    //     const NetworkImage(''),
    //   ),
    //   decoration: profilePhotoDecoration(
    //     const AssetImage(AppAssets.noProfilePic),
    //   ),
    // );
  }

  // BoxDecoration profilePhotoDecoration(ImageProvider<Object> image) {
  //   return BoxDecoration(
  //     border: Border.all(color: Colors.grey[400]!),
  //     shape: BoxShape.circle,
  //     image: DecorationImage(
  //       image: image,
  //       onError: (exception, stackTrace) {},
  //       fit: BoxFit.cover,
  //     ),
  //   );
  // }
}

class StaticImage extends StatelessWidget {
  const StaticImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppAssets.noProfilePic, fit: BoxFit.cover);
  }
}
