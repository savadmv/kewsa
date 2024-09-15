import 'package:kewsa/imports_bindings.dart';
import 'package:flutter/cupertino.dart';

class Loading extends StatelessWidget {
  const Loading({
    this.radius = 16,
    this.color,
    super.key,
  });

  final double radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
        color: color ?? AppColors.dark,
        radius: radius,
      ),
    );
  }
}
