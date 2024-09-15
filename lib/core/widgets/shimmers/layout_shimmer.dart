import 'package:kewsa/imports_bindings.dart';
import 'package:shimmer/shimmer.dart';

class LayoutShimmer extends StatelessWidget {
  const LayoutShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Shimmer.fromColors(
          baseColor: Colors.white,
          highlightColor: Colors.grey[300]!,
          child: ColoredBox(
            color: Colors.grey[300]!,
            child: SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
            ),
          ),
        );
      },
    );
  }
}
