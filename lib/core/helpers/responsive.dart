import 'package:kewsa/imports_bindings.dart';

/// Breakpoints for responsive design based on screen width.
const int _smallScreenSize = 500;
const int _mediumScreenSize = 900;
const int _largeScreenSize = 1200;

/// Enum defining different screen sizes for responsive layout.
enum Screen {
  /// Small screen (width <= 400)
  s,

  /// Medium screen (400 < width <= 800)
  m,

  /// Large screen (800 < width <= 1100)
  l,

  /// Extra large screen (width > 1100)
  xl,
}

/// Checks if the screen size is considered small (width <= 400).
bool isSmallScreen(BuildContext context) => _screenSize(context, (width) => width <= _smallScreenSize);

/// Checks if the screen size is considered medium (400 < width <= 800).
bool isMediumScreen(BuildContext context) => _screenSize(context, (width) => width > _smallScreenSize && width <= _mediumScreenSize);

/// Checks if the screen size is considered large (800 < width <= 1100).
bool isLargeScreen(BuildContext context) => _screenSize(context, (width) => width > _mediumScreenSize && width <= _largeScreenSize);

/// Checks if the screen size is considered extra-large (width > 1100).
bool isExtraLargeScreen(BuildContext context) => _screenSize(context, (width) => width > _largeScreenSize);

/// Determines the current screen size based on the width using the provided condition.
bool _screenSize(BuildContext context, bool Function(double) condition) {
  return condition.call(context.width);
}

/// Determines the current screen size based on the width using the provided condition.
double responsiveSize(BuildContext context, {required double s, double? m, double? l, double? xl}) {
  return switch (context.width) {
    > _largeScreenSize => xl ?? l ?? m ?? s, // Extra-large screen
    > _mediumScreenSize => l ?? m ?? s, // Large screen
    > _smallScreenSize => m ?? s, // Medium screen
    _ => s, // Small screen
  };
}

/// Determines the current screen size based on the width using the provided condition.
int responsiveCount(BuildContext context, {required double contentWidth}) {
  final count = context.width / contentWidth;
  if (count < 1) {
    return 1;
  }
  return count.toInt();
}

/// A widget that adapts its child based on the screen size.
class ResponsiveWidget extends StatelessWidget {
  /// Constructs a ResponsiveWidget.
  ///
  /// [s] is required and represents the widget to display on small screens.
  /// [m], [l], [xl] are optional and represent widgets to display on medium, large, and extra-large screens respectively.
  const ResponsiveWidget({
    required this.s,
    this.m,
    this.l,
    this.xl,
    super.key,
  });

  /// Widget to display on small screens (width <= 400).
  final Widget s;

  /// Widget to display on medium screens (400 < width <= 800).
  final Widget? m;

  /// Widget to display on large screens (800 < width <= 1100).
  final Widget? l;

  /// Widget to display on extra-large screens (width > 1100).
  final Widget? xl;

  @override
  Widget build(BuildContext context) {
    write('hey${context.width}  ${context.width > _smallScreenSize}');
    return switch (context.width) {
      > _largeScreenSize => xl ?? l ?? m ?? s, // Extra-large screen
      > _mediumScreenSize => l ?? m ?? s, // Large screen
      > _smallScreenSize => m ?? s, // Medium screen
      _ => s, // Small screen
    };
  }
}
