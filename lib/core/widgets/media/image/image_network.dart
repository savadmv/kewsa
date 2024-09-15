import 'package:kewsa/imports_bindings.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageNetwork extends StatelessWidget {
  const ImageNetwork(
    this.imageUrl, {
    super.key,
    this.placeholderWidget,
    this.errorWidget,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  ///image url to load image
  final String? imageUrl;

  ///loading widget while image is loading
  final Widget? placeholderWidget;

  ///error widget to show error when image loading failed or invalid image url
  final Widget? errorWidget;

  final double? width;
  final double? height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    if (imageUrl?.isEmpty ?? true) {
      return errorWidget ?? _empty;
    }
    return CachedNetworkImage(
      imageUrl: imageUrl!,
      width: width,
      height: height,
      fit: fit,
      placeholder: (_, __) {
        return placeholderWidget ?? const LayoutShimmer();
      },
      errorWidget: (_, __, error) {
        return errorWidget ?? Center(child: _empty);
      },
    );
  }

  Widget get _empty => SizedBox(
        height: height,
        width: width,
        child: SizedBox(
          height: height,
          width: width,
          child: Icon(
            Icons.error_outline,
            size: 64,
            color: AppColors.dark.withOpacity(.4),
          ),
        ),
      );
}
