import 'package:kewsa/imports_bindings.dart';
import 'package:shimmer/shimmer.dart';

///
class KShimmer extends StatelessWidget {
  ///
  const KShimmer({
    this.width,
    this.height,
    this.radius = 8,
    super.key,
  });

  ///
  factory KShimmer.text({
    double? width,
    double? height,
    double radius = 0,
  }) {
    return KShimmer(
      height: height ?? 12,
      width: width ?? AppView.navKey.currentContext!.width * 0.4,
      radius: radius,
    );
  }

  ///
  final double? width;

  ///
  final double? height;

  ///
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: ColoredBox(
          color: Colors.grey,
          child: SizedBox(
            width: width ?? double.maxFinite,
            height: height ?? double.maxFinite,
          ),
        ),
      ),
    );
  }
}

///
