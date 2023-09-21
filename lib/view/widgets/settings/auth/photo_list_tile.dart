import 'package:cached_network_image/cached_network_image.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:flutter/material.dart';
import 'package:gpa_pro/core/constants/app_links.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/shared/static_image.dart';
import 'package:gpa_pro/data/model/user.dart';

class PhotoListTile extends StatelessWidget {
  const PhotoListTile(this.dimension, this.userData, {super.key});
  final double? dimension;
  final UserData? userData;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: dimension,
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(AppConstant.kDefaultRadius),
        child: Visibility(
          visible: userData?.userImage != null,
          replacement: const StaticImage(),
          child: CachedNetworkImage(
            imageUrl: "${AppLinks.image}/${userData?.userImage}".trim(),
            imageBuilder: (context, imageProvider) {
              return FullScreenWidget(
                disposeLevel: DisposeLevel.Medium,
                backgroundIsTransparent: true,
                child: Center(
                  child: Hero(
                    tag: "${AppLinks.image}/${userData?.userImage}".trim(),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(AppConstant.kDefaultRadius),
                      child: Image(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
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
  }
}
