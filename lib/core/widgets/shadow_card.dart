import 'package:kewsa/imports_bindings.dart';

class ShadowCard extends StatelessWidget {
  const ShadowCard({
    required this.child,
    super.key,
    this.border,
    this.radius,
    this.padding = const EdgeInsets.all(8),
    this.contentPadding = const EdgeInsets.all(16),
  });

  final Widget child;
  final BoxBorder? border;
  final double? radius;
  final EdgeInsets padding;
  final EdgeInsets contentPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 20),
          color: context.theme.scaffoldBackgroundColor,
          border: border,
          boxShadow: const [
            BoxShadow(
              spreadRadius: .2,
              blurRadius: .2,
              color: Colors.grey,
            ),
          ],
        ),
        child: Padding(
          padding: contentPadding,
          child: child,
        ),
      ),
    );
  }
}
