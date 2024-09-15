import 'package:kewsa/imports_bindings.dart';

class FirebaseImage extends StatelessWidget {
  const FirebaseImage(
    this.imageUrl, {
    super.key,
    this.placeholderWidget,
    this.errorWidget,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  final String? imageUrl;
  final Widget? placeholderWidget;
  final Widget? errorWidget;
  final double? width;
  final double? height;
  final BoxFit fit;

  Future<String?> _loadImage(String? url) async {
    if (url == null || url.isEmpty) return null;
    try {
      return await FirebaseServices().getFile(url);
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (imageUrl?.isEmpty ?? true) {
      return errorWidget ?? _empty;
    }

    return FutureBuilder<String?>(
      future: _loadImage(imageUrl),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return placeholderWidget ?? const Loading();
        } else if (snapshot.hasError || snapshot.data == null) {
          return errorWidget ?? _empty;
        } else {
          return Image.file(
            File(snapshot.data!),
            fit: fit,
            width: width,
            height: height,
          );
        }
      },
    );
  }

  Widget get _empty => SizedBox(
        height: height,
        width: width,
        child: Icon(
          Icons.error_outline,
          size: 64,
          color: AppColors.dark.withOpacity(.4),
        ),
      );
}
