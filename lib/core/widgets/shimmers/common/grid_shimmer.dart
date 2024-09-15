import 'package:kewsa/imports_bindings.dart';

///
class GridProductsShimmer extends StatelessWidget {
  ///
  const GridProductsShimmer({
    required this.child,
    super.key,
    this.crossAxisCount = 4,
    this.crossAxisSpacing = 12,
    this.mainAxisSpacing = 12,
    this.height = 1.2,
    this.itemCount = 8,
  });

  ///
  final int crossAxisCount;

  ///
  final double crossAxisSpacing;

  ///
  final double mainAxisSpacing;

  ///
  final double height;

  ///
  final int itemCount;

  ///
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      primary: false,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
        childAspectRatio: context.width / (context.height / height),
      ),
      itemCount: itemCount,
      itemBuilder: (BuildContext context, int index) {
        return child;
      },
    );
  }
}
