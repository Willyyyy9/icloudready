import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:icloudready/app/resources/asset_manager.dart';
import 'package:icloudready/app/resources/value_manager.dart';

class PropertyDetailImage extends StatelessWidget {
  const PropertyDetailImage({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return FullScreenWidget(
      disposeLevel: DisposeLevel.High,
      child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(AppSize.s16),
            bottomRight: Radius.circular(AppSize.s16),
          ),
          child: CachedNetworkImage(
            imageUrl: image,
            placeholder: (context, _) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, _, __) =>
                Image.asset(ImageAssets.characterError),
            fit: BoxFit.cover,
            height: MediaQuery.sizeOf(context).height * 0.35,
            width: double.infinity,
          )),
    );
  }
}
